package com.example.demo.service.impl;

import com.example.demo.entity.ClassTask;
import com.example.demo.entity.ClassroomInfo;
import com.example.demo.entity.CoursePlan;
import com.example.demo.entity.vo.ConstantInfo;
import com.example.demo.mapper.*;
import com.example.demo.service.ClassSchedulingService;
import com.example.demo.util.ClassSchedulUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 排课service层
 */
@Service
public class ClassSchedulingServiceImpl implements ClassSchedulingService {
    //开课任务
    @Autowired
    private ClassTaskMapper classTaskMapper;
    //课程计划
    @Autowired
    private CoursePlanMapper coursePlanMapper;
    //老师课程安排
    @Autowired
    private TeacherCourseMapper teacherCourseMapper;
    //学院教学区安排
    @Autowired
    private SchoolTeachBuildInfoMapper schoolTeachBuildInfoMapper;
    //教室信息
    @Autowired
    private ClassroomInfoMapper classroomInfoMapper;
    //班级信息
    @Autowired
    private ClassInfoMapper classInfoMapper;

    //没有固定时间
    private final String UNFIXED_TIME = "unFixedTime";
    //固定时间
    private final String IS_FIXED_TIME = "isFixedTime";

    //先将再全校范围内分配的教学楼信息做一个查询（针对特殊要求的教室）
    @Transactional
    @Override
    public Boolean classScheduling(ClassTask classTask) {
        try {
            //第一步先获得开课任务
            List<ClassTask> classTaskList = classTaskMapper.listByTermName(classTask);
            //第二步将开课任务进行编码
            List<Map<String, List<String>>> codeList = coding(classTaskList);
            //第三步开始进行时间分配
            List<String> resultGeneList = codingTime(codeList);
            //第四步对已分配好时间的基因进行分类，生成以班级为范围的个体
            Map<String, List<String>> individualMap = transformIndividual(resultGeneList);
            //第五步进行遗传进化操作
            individualMap = geneticEvolution(individualMap);
            //第六步分配教室
            List<String> resultList = finalResult(individualMap);
            //第七步对分配好时间教室的基因进行解码，准备存入数据库
            List<CoursePlan> coursePlanList = decoding(resultList);
            for (CoursePlan coursePlan : coursePlanList) {
                //将分配好时间和教室的对象更新到数据库中的course_plan数据表中
                System.out.println("分配好时间和教室:" + coursePlan);
                coursePlanMapper.insert(coursePlan);
                //将分配好时间和教室的对象更新到数据库中的teacher_course数据表中
                teacherCourseMapper.insertCoursePlan(coursePlan);
            }
            //第八步将开课学期还有上课周数更新进上课计划表(course_plan)，在编码里不包括开课学期以及上课周数所以需要这一步操作
            for (ClassTask classTask1 : classTaskList) {
                System.out.println("开课学期还有上课周数:" + classTask1);
                coursePlanMapper.updateCoursePlan(classTask1);
            }
            //操作全部完成
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 开始解码，将基因字符串解码为对象
     *
     * @param resultList
     * @return
     */
    private List<CoursePlan> decoding(List<String> resultList) {
        List<CoursePlan> coursePlanList = new ArrayList<>();
        for (String gene : resultList) {
            CoursePlan coursePlan = new CoursePlan();
            coursePlan.setSchoolNo(ClassSchedulUtil.cutGene(ConstantInfo.COLLEGE_NO, gene));
            coursePlan.setClassNo(ClassSchedulUtil.cutGene(ConstantInfo.CLASS_NO, gene));
            coursePlan.setCourseNo(ClassSchedulUtil.cutGene(ConstantInfo.COURSE_NO, gene));
            coursePlan.setStaffNo(ClassSchedulUtil.cutGene(ConstantInfo.TEACHER_NO, gene));
            coursePlan.setClassroomNo(ClassSchedulUtil.cutGene(ConstantInfo.CLASSROOM_NO, gene));
            coursePlan.setClassTime(ClassSchedulUtil.cutGene(ConstantInfo.COLLEGE_NO, gene));
            coursePlanList.add(coursePlan);
        }
        return coursePlanList;
    }

    /**
     * 准备开始分配教室
     *
     * @param individualMap
     * @return
     */
    private List<String> finalResult(Map<String, List<String>> individualMap) {
        //用来存放结果（加上教室编号的基因）
        List<String> resultList = new ArrayList<>();
        //合拢个体
        List<String> resultGeneList = closedGene(individualMap);
        System.out.println(resultGeneList);
        //教室编号
        String classroomNo;
        //学院编号集合
        List<String> collegeNoList = classTaskMapper.selectByColumnName(ConstantInfo.COLLEGE_NO);
//        List<String> collegeNoList = classTaskDao.selectByColumnName(ConstantInfo.COLLEGE_NO);
        //将基因按学院分配
        Map<String, List<String>> map = geneByCollege(resultGeneList, collegeNoList);
        for (String collegeNo : map.keySet()) {
            //根据教务处划分的教学区域，查询学院对应的教学楼编号
            System.out.println("学院编码：" + collegeNo);
            String teachBuildNo = schoolTeachBuildInfoMapper.selectByTeachBuildNo(collegeNo);
            //根据学院编号查询出该学院下的基因准备开始安排教室
            List<String> tempResultGeneList = map.get(collegeNo);
            System.out.println(tempResultGeneList);
            //根据教学楼编号查询出该教学楼下所有的教室来进行随机分配
            List<ClassroomInfo> classroomInfoList = classroomInfoMapper.selectByTeachBuildNo(teachBuildNo);
            for (String gene : tempResultGeneList) {
                classroomNo = assignClassroom(gene, classroomInfoList, resultList);
                gene = gene + classroomNo;
                resultList.add(gene);
            }
        }
        return resultList;
    }

    /**
     * @param gene
     * @param classroomInfoList
     * @param resultList
     * @return
     */
    private String assignClassroom(String gene, List<ClassroomInfo> classroomInfoList, List<String> resultList) {
        List<ClassroomInfo> sportsBuildingInfo = classroomInfoMapper.selectByTeachBuildNo("01");//XX大楼
        List<ClassroomInfo> experimentalBuildingInfo = classroomInfoMapper.selectByTeachBuildNo("02");//XX大楼
        List<ClassroomInfo> medicalBuildingInfo = classroomInfoMapper.selectByTeachBuildNo("03");//医学实验大楼

        String classNo = ClassSchedulUtil.cutGene(ConstantInfo.CLASS_NO, gene);
        System.out.println(classNo);
        int studentNumber = classInfoMapper.selectByStudentNumber(classNo);
        System.out.println(studentNumber);
        String courseAttr = ClassSchedulUtil.cutGene(ConstantInfo.COURSE_ATTR, gene);
        //如果课程属性是"03"表示体育课，从体育楼里选择一个教室
        if (courseAttr.equals(ConstantInfo.PHYSICAL_CODE)) {
            return chooseClassroom(studentNumber, gene, sportsBuildingInfo, resultList);
        } else if (courseAttr.equals(ConstantInfo.ELECTRICITY_CODE) || courseAttr.equals(ConstantInfo.COMPUTER_CODE) || courseAttr.equals(ConstantInfo.PHYSICAL_EXPERIMENT_CODE)) {
            //如果课程属性是"08"、"10"、"12"表示电子实验课、计算机实验课、物理实验课则需要在实验楼里选择一个教室
            return chooseClassroom(studentNumber, gene, experimentalBuildingInfo, resultList);
        } else if (courseAttr.equals(ConstantInfo.MEDICAL_CODE)) {
            //如果课程属性是"04"表示医学实验课，需要从医学楼里选择一个教室
            return chooseClassroom(studentNumber, gene, medicalBuildingInfo, resultList);
        } else {
            //理论实验课码值以及其他特殊的码值，不需要在特殊的教学楼里分配。由教务处指定的楼已经可以直接获取
            return chooseClassroom(studentNumber, gene, classroomInfoList, resultList);
        }
    }

    /**
     * 选择教室
     *
     * @param studentNumber
     * @param gene
     * @param classroomLocationList
     * @param resultList
     * @return
     */
    private String chooseClassroom(int studentNumber, String gene, List<ClassroomInfo> classroomLocationList, List<String> resultList) {
        int min = 0;
        int max = classroomLocationList.size() - 1;
        //生成一个随机数，用来选取一个教室
        int temp = min + (int) (Math.random() * (max + 1 - min));
        ClassroomInfo classroomInfo = classroomLocationList.get(temp);
        if (judgingClassroom(studentNumber, gene, classroomInfo, resultList)) {
            return classroomInfo.getClassroomNumber();
        } else {
            return chooseClassroom(studentNumber, gene, classroomLocationList, resultList);
        }
    }

    /**
     * 判断教室是否符合要求，教室属性和课程属性是否对应、教室容量是否大于学生上课人数
     *
     * @param studentNumber
     * @param gene
     * @param classroomInfo
     * @param resultList
     * @return
     */
    private boolean judgingClassroom(int studentNumber, String gene, ClassroomInfo classroomInfo, List<String> resultList) {
        String courseAttr = ClassSchedulUtil.cutGene(ConstantInfo.COURSE_ATTR, gene);
        //如果课程属性是"01"或者"02"则表示是理论课教室，则教室属性为"01"即可
        if (courseAttr.equals(ConstantInfo.PROFESSIONAL_CODE) || courseAttr.equals(ConstantInfo.ELECTIVE_CODE)) {
            //课程属性"01"或者"02"同时教室属性为"01"
            if (classroomInfo.getClassroomAttr().equals("01")) {
                //教室容量大于学上课人数
                if (studentNumber <= classroomInfo.getCapacity()) {
                    //判断教室上课时间是否重复
                    return isRedundant(gene, resultList, classroomInfo);
                } else {
                    return false;
                }
            } else {
                return false;
            }
        } else {
            //如果课程属性不为"01或者"02"则课程属性和教室属性一一对应
            if (ClassSchedulUtil.cutGene(ConstantInfo.COURSE_ATTR, gene).equals(classroomInfo.getClassroomAttr())) {
                //教室容量大于学生容量
                if (studentNumber <= classroomInfo.getCapacity()) {
                    //判断教室上课时间是否重复
                    return isRedundant(gene, resultList, classroomInfo);
                } else {
                    return false;
                }
            } else {
                return false;
            }
        }
    }


    /**
     * 判断在同一时间片是否有同时两个班级在同一个教室上课
     *
     * @param gene
     * @param resultList
     * @param classroomInfo
     * @return
     */
    private boolean isRedundant(String gene, List<String> resultList, ClassroomInfo classroomInfo) {
        //当教室还没有开始分配时，第一个分配的班级可以随意分配教室而不会重复
        if (resultList.size() == 0) {
            return true;
        } else {
            for (String resultGene : resultList) {
                //如果分配的教室已经在之前分配了则需要去判断时间是否有冲突
                if (ClassSchedulUtil.cutGene(ConstantInfo.CLASSROOM_NO, resultGene).equals(classroomInfo.getClassroomNumber())) {
                    //如果时间一样的话测表示有冲突
                    if (ClassSchedulUtil.cutGene(ConstantInfo.CLASS_TIME, gene).equals(ClassSchedulUtil.cutGene(ConstantInfo.CLASS_TIME, resultGene))) {
                        return false;
                    }
                }
            }
        }
        return true;
    }

    /**
     * 将基因集合按学院分配
     *
     * @param resultGeneList
     * @param collegeNoList
     * @return
     */
    private Map<String, List<String>> geneByCollege(List<String> resultGeneList, List<String> collegeNoList) {
        Map<String, List<String>> map = new HashMap<>();
        for (String collegeNo : collegeNoList) {
            List<String> geneList = new ArrayList<>();
            for (String gene : resultGeneList) {
                if (ClassSchedulUtil.cutGene(ConstantInfo.COLLEGE_NO, gene).equals(collegeNo)) {
                    geneList.add(gene);
                }
            }
            if (geneList.size() > 0) {
                map.put(collegeNo, geneList);
            }
        }
        return map;
    }

    /**
     * 开始遗传进化操作
     *
     * @param individualMap
     * @return
     */
    private Map<String, List<String>> geneticEvolution(Map<String, List<String>> individualMap) {
        int generation = ConstantInfo.GENERATION;//进化代数设为100
        List<String> resultGeneList;
        for (int i = 0; i < generation; ++i) {
            //第一步完成交叉操作,产生新一代的父本
            individualMap = hybridization(individualMap);
            //第二步合拢个体准备变异
            closedGene(individualMap);
            //第三步开始变异
            resultGeneList = geneticMutation(closedGene(individualMap));
            //第四步进行冲突检测并消除
            conflictResolution(resultGeneList);
            //第五步将冲突消除后的个体再次进行分割，按班级进行分配准备进入下一次的进化
            individualMap = transformIndividual(conflictResolution(resultGeneList));

        }
        return individualMap;
    }

    /**
     * 解决冲突，同一时间一个教师上多门课的冲突
     *
     * @param resultGeneList
     * @return
     */
    private List<String> conflictResolution(List<String> resultGeneList) {
        exit:
        for (int i = 0; i < resultGeneList.size(); ++i) {
            String gene = resultGeneList.get(i);
            String teacherNo = ClassSchedulUtil.cutGene(ConstantInfo.TEACHER_NO, gene);
            String classTime = ClassSchedulUtil.cutGene(ConstantInfo.CLASS_TIME, gene);
            for (int j = i + 1; j < resultGeneList.size(); ++j) {
                String tempGene = resultGeneList.get(j);
                String tempTeacherNo = ClassSchedulUtil.cutGene(ConstantInfo.TEACHER_NO, tempGene);
                String tempClassTime = ClassSchedulUtil.cutGene(ConstantInfo.CLASS_TIME, tempGene);
                if (teacherNo.equals(tempTeacherNo) && classTime.equals(tempClassTime)) {
                    String newClassTime = ClassSchedulUtil.randomTime(gene, resultGeneList);
                    gene = gene.substring(0, 29) + newClassTime;
                    continue exit;
                }

            }
        }
        return resultGeneList;
    }

    /**
     * 基因变异操作
     *
     * @param resultGeneList
     * @return
     */
    private List<String> geneticMutation(List<String> resultGeneList) {
        int min = 0;
        int max = resultGeneList.size() - 1;
        //变异概率
        double mutationRate = 0.01;
        //每一代所要选取的变异个数,计算公式为基因数量*变异率
        int mutationNumber = (int) (resultGeneList.size() * mutationRate);
        if (mutationNumber < 1) {
            mutationNumber = 1;
        }
        for (int i = 0; i < mutationNumber; ) {
            //生成随机数
            int temp = min + (int) (Math.random() * (max + 1 - min));
            String gene = resultGeneList.get(temp);
            if (ClassSchedulUtil.cutGene(ConstantInfo.IS_FIX, gene).equals("2")) {
                break;
            } else {
                String newClassTime = ClassSchedulUtil.randomTime(gene, resultGeneList);
                gene = gene.substring(0, 29) + newClassTime;
                resultGeneList.remove(temp);
                resultGeneList.add(temp, gene);
                i = i + 1;
            }

        }
        return resultGeneList;
    }

    /**
     * 将分割好的个体（按班级分好的初始课表）重新合拢在一起，方便进行冲突检测
     *
     * @param individualMap
     */
    private List<String> closedGene(Map<String, List<String>> individualMap) {
        List<String> resultGeneList = new ArrayList<>();
        for (List<String> individualList : individualMap.values()) {
            resultGeneList.addAll(individualList);
        }
        return resultGeneList;
    }

    /**
     * 完成整个种群的交叉操作
     *
     * @param individualMap
     * @return
     */
    private Map<String, List<String>> hybridization(Map<String, List<String>> individualMap) {
        for (String classNo : individualMap.keySet()) {
            System.out.println(individualMap.keySet());
            System.out.println(classNo);
            List<String> individualList = individualMap.get(classNo);
            List<String> oldIndividualList = individualList;
            //进行基因的交叉操作生成新个体
            individualList = selectiveGene(individualList);
            //对父代的适应度值和新生成的子代适应值进行对比，选择适应度值高的一个进入下一代的遗传
            if (ClassSchedulUtil.alculateExpectedValue(individualList) >= ClassSchedulUtil.alculateExpectedValue(oldIndividualList)) {
                individualMap.put(classNo, individualList);
            } else {
                individualMap.put(classNo, oldIndividualList);
            }

        }
        return individualMap;
    }

    /**
     * 个体间的随机选择两条基因准备进行杂交并生成一个新个体
     *
     * @param individualList
     * @return
     */
    private List<String> selectiveGene(List<String> individualList) {
        int min = 0;
        int max = individualList.size() - 1;
        boolean flag;
        do {
            //随机生成0到individualList.size - 1的两个数，用来选取基因
            int firstTemp = min + (int) (Math.random() * (max + 1 - min));//选取第一个随机数
            int secondTemp = min + (int) (Math.random() * (max + 1 - min));//选取第二个随机数
            String firstGene = individualList.get(firstTemp);//获取第一条基因
            String secondGene = individualList.get(secondTemp);//获取第二条基因
            //判断选择的两个随机数为否相同，确保不会选择同一条基因进行交叉操作
            if (firstTemp == secondTemp) {
                flag = false;
            } else if (ClassSchedulUtil.cutGene(ConstantInfo.IS_FIX, firstGene).equals("2") || ClassSchedulUtil.cutGene(ConstantInfo.IS_FIX, secondGene).equals("2")) {
                //判断选择的两条基因对应的时间值是否固定，如果固定则重新选择两条
                flag = false;
            } else {
                //分别获取所选的两条基因的时间片值
                String firstClassTime = ClassSchedulUtil.cutGene(ConstantInfo.CLASS_TIME, firstGene);
                String secondClassTime = ClassSchedulUtil.cutGene(ConstantInfo.CLASS_TIME, secondGene);
                //将它们的时间进行交换
                firstGene = firstGene.substring(0, 29) + secondClassTime;
                secondGene = secondGene.substring(0, 29) + firstClassTime;
                //对原有的基因进行移除，然后将交换过时间的两条基因添加进去
                individualList.remove(firstTemp);
                individualList.add(firstTemp, firstGene);
                individualList.remove(secondTemp);
                individualList.add(secondTemp, secondGene);
                flag = true;
            }
        } while (!flag);
        return individualList;
    }

    /**
     * 将编码按班级进行分类，形成初始个体（不含教室的初始课表）
     *
     * @param resultGeneList
     * @return
     */
    private Map<String, List<String>> transformIndividual(List<String> resultGeneList) {
        Map<String, List<String>> individualMap = new HashMap<>();
        List<String> classNoList = classTaskMapper.selectByColumnName(ConstantInfo.CLASS_NO);
        for (String classNo : classNoList) {
            List<String> geneList = new ArrayList<>();
            for (String gene : resultGeneList) {
                if (classNo.equals(ClassSchedulUtil.cutGene(ConstantInfo.CLASS_NO, gene))) {
                    geneList.add(gene);
                }
            }

            if (geneList.size() > 1) {
                individualMap.put(classNo, geneList);
            }
        }
        return individualMap;
    }

    /**
     * 获取基因数组为基因分配时间，完成完整版的基因编码
     *
     * @param codeList
     * @return
     */
    private List<String> codingTime(List<Map<String, List<String>>> codeList) {
        List<String> resultGeneList = new ArrayList<>();
        List<String> isFixedTimeGeneList = codeList.get(0).get(IS_FIXED_TIME);
        List<String> unFixedTimeGeneList = codeList.get(0).get(UNFIXED_TIME);
        //已经固定时间的编码时间已经排好，不需要再排
        resultGeneList.addAll(isFixedTimeGeneList);
        //时间不固定的基因由程序进行随机分配
        for (String gene : unFixedTimeGeneList) {
            //获取一个不重复的时间片值
            String classTime = ClassSchedulUtil.randomTime(gene, resultGeneList);
            gene = gene.substring(0, 29) + classTime;
            resultGeneList.add(gene);
        }
        return resultGeneList;
    }

    /**
     * 将从表中查询的开课任务书对象集合进行编码，组成初始基因
     * 编码规则为：是否固定+班级编号+教师编号+课程编号+课程属性+开课时间
     * 其中如果是否固定为否则开课时间默认填充为"00"
     *
     * @param classTaskList
     * @return
     */
    private List<Map<String, List<String>>> coding(List<ClassTask> classTaskList) {
        List<Map<String, List<String>>> geneList = new ArrayList<>();
        Map<String, List<String>> geneListMap = new HashMap<>();
        //不固定时间的编码基因组
        List<String> unFixedTimeGeneList = new ArrayList<>();
        //固定时间的编码基因组
        List<String> isFixedTimeGeneList = new ArrayList<>();
        for (ClassTask classTask : classTaskList) {
            //根据isFix的值判断是否固定，为1则不固定classTime默认填充”00“
            if (classTask.getIsFix().equals("1")) {
                //计算一周的上课次数，一次对应一个基因，2次对应两个基因。依此类推
                int size = classTask.getWeeksNumber() / 2;
                for (int i = 0; i < size; i++) {
                    String gene = classTask.getIsFix() +
                            classTask.getSchoolNo() +
                            classTask.getClassNo() +
                            classTask.getStaffNo() +
                            classTask.getCourseNo() +
                            classTask.getCourseAttr() +
                            ConstantInfo.DEFAULT_CLASS_TIME;
                    unFixedTimeGeneList.add(gene);
                }
            }
            //isFix的值为2则classTime有值，需要对classTime的值进行切割
            if (classTask.getIsFix().equals("2")) {
                int size = classTask.getWeeksNumber() / 2;
                for (int i = 0; i < size; i++) {
                    System.out.println(classTask.getClassTime());
                    String classTime = classTask.getClassTime().substring(i * 2, (i + 1) * 2);
                    System.out.println(classTime);
                    String gene = classTask.getIsFix() +
                            classTask.getSchoolNo() +
                            classTask.getClassNo() +
                            classTask.getStaffNo() +
                            classTask.getCourseNo() +
                            classTask.getCourseAttr() +
                            classTime;
                    isFixedTimeGeneList.add(gene);
                }
            }
        }
        geneListMap.put(UNFIXED_TIME, unFixedTimeGeneList);
        geneListMap.put(IS_FIXED_TIME, isFixedTimeGeneList);
        geneList.add(geneListMap);
        return geneList;
    }
}
