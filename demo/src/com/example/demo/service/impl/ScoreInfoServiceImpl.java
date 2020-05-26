package com.example.demo.service.impl;

import com.example.demo.config.FileConfig;
import com.example.demo.entity.*;
import com.example.demo.mapper.*;
import com.example.demo.service.ScoreInfoService;
import com.example.demo.util.PoiUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
@Service
public class ScoreInfoServiceImpl implements ScoreInfoService {
    @Autowired
    private FileInfoMapper fileInfoMapper;

    @Autowired
    private ScoreInfoMapper scoreInfoMapper;
    @Autowired
    private AssessmentInfoMapper assessmentInfoMapper;
    @Autowired
    private SchoolInfoMapper schoolInfoMapper;
    @Autowired
    private ClassInfoMapper classInfoMapper;
    @Autowired
    private StudentInfoMapper studentInfoMapper;

    @Override
    public String insert(ScoreInfo scoreInfo) {
        int result = scoreInfoMapper.countByScoreInfo(scoreInfo);
        if (result > 0) {
            return "student_exit";
        }
        //先插入考核项成绩
        AssessmentInfo assessmentInfo = new AssessmentInfo();
        assessmentInfo.setHomeworkAssessment(scoreInfo.getHomeworkAssessment());
        assessmentInfo.setExperimentalExamination(scoreInfo.getExperimentalExamination());
        assessmentInfo.setPracticalExamination(scoreInfo.getPracticalExamination());
        assessmentInfo.setFinalExamination(scoreInfo.getFinalExamination());
        assessmentInfo.setRemark(scoreInfo.getRemark());
        assessmentInfoMapper.insert(assessmentInfo);
        //获取考核项返回的主键id
        System.out.println("返回id" + assessmentInfo.getId());
        scoreInfo.setAssessmentInfoId(assessmentInfo.getId());
        //再插入成绩
        scoreInfoMapper.insert(scoreInfo);

        return null;
    }

    @Override
    public String update(ScoreInfo scoreInfo) {
        int result = scoreInfoMapper.countByScoreInfo(scoreInfo);
        if (result > 0) {
            return "student_exit";
        }
        AssessmentInfo assessmentInfo = new AssessmentInfo();
        //先修改考核项
        assessmentInfo.setId(scoreInfo.getAssessmentInfoId());
        assessmentInfo.setHomeworkAssessment(scoreInfo.getHomeworkAssessment());
        assessmentInfo.setExperimentalExamination(scoreInfo.getExperimentalExamination());
        assessmentInfo.setPracticalExamination(scoreInfo.getPracticalExamination());
        assessmentInfo.setFinalExamination(scoreInfo.getFinalExamination());
        assessmentInfo.setRemark(scoreInfo.getRemark());
        assessmentInfoMapper.update(assessmentInfo);

        scoreInfoMapper.update(scoreInfo);
        return null;
    }

    @Override
    public void delete(Integer id) {
        //通过id查询考核项id
        scoreInfoMapper.selectById(id);
        ScoreInfo scoreInfo = scoreInfoMapper.selectById(id);
        assessmentInfoMapper.delete(scoreInfo.getAssessmentInfoId());
        scoreInfoMapper.delete(id);
    }

    @Override
    public Integer deleteSelection(List<Integer> idList) {
        System.out.println(idList);
        //批量获取考核id
        List<Integer> list = scoreInfoMapper.listByAssessmentId(idList);
        System.out.println(list);

        //批量删除考核项
//        assessmentInfoMapper.deleteSelection(list);
        return scoreInfoMapper.deleteSelection(idList);
    }

    @Override
    public ScoreInfo selectById(Integer id) {
        return scoreInfoMapper.selectById(id);
    }

    @Override
    public PageInfo<ScoreInfo> listByScoreInfo(ScoreInfo scoreInfo, Integer pageNum, Integer pageSize) {
        // 设置分页参数
        PageHelper.startPage(pageNum, pageSize);
        // 查询集合
        List<ScoreInfo> scoreInfoList = scoreInfoMapper.listByScoreInfo(scoreInfo);
        for (ScoreInfo s :
                scoreInfoList) {
            s.setScore(s.getExperimentalExamination() * 0.2
                    + s.getHomeworkAssessment() * 0.1
                    + s.getPracticalExamination() * 0.1
                    + s.getFinalExamination() * 0.6);
            if(s.getStudentState().equals("A")){
                s.setStudentState("通过");
            }
            if(s.getStudentState().equals("B")){
                s.setStudentState("补考");
            }
            if(s.getStudentState().equals("C")){
                s.setStudentState("重修");
            }

        }
        PageInfo<ScoreInfo> pageInfo = new PageInfo<>(scoreInfoList);
        return pageInfo;
    }

    @Override
    public void exportScoreInfo(ScoreInfo scoreInfo) {
        // 查询集合
        List<ScoreInfo> scoreInfoList = scoreInfoMapper.exportScoreInfo(scoreInfo);
        System.out.println(scoreInfoList);
        try {
            PoiUtil.exportXLSScoreInfo(scoreInfoList);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void importExcelXLSXScore(Integer fileInfoId) {
        InputStream is = null;
        // 获取file对象
        FileInfo file = fileInfoMapper.selectById(fileInfoId);
        String fileName = file.getAccessUrl();
        fileName = fileName.substring(7);
        System.out.println("----fileName---" + fileName.toString());
        String path = FileConfig.UPLOAD_PATH + File.separator + fileName;
        List<ScoreInfo> scoreInfoList = new ArrayList<>();
        List<ScoreInfo> scoreInfoList1 = new ArrayList<>();
        try {
            //判断Excel的格式(.xls或.xlsx)
            if (fileName.toString().endsWith(".xls")) {
                scoreInfoList = PoiUtil.importExcelXLSScore(path);
            }else {
                scoreInfoList = PoiUtil.importExcelXLSXScore(path);
                AssessmentInfo assessmentInfo = new AssessmentInfo();
                for (ScoreInfo scoreInfo :
                        scoreInfoList) {
                    //先插入考核项成绩
                    assessmentInfo.setHomeworkAssessment(scoreInfo.getHomeworkAssessment());
                    assessmentInfo.setExperimentalExamination(scoreInfo.getExperimentalExamination());
                    assessmentInfo.setPracticalExamination(scoreInfo.getPracticalExamination());
                    assessmentInfo.setFinalExamination(scoreInfo.getFinalExamination());
                    assessmentInfo.setRemark(scoreInfo.getRemark());
                    assessmentInfoMapper.insert(assessmentInfo);
                    //获取考核项返回的主键id
                    System.out.println("返回id:" + assessmentInfo.getId());
                    scoreInfo.setAssessmentInfoId(assessmentInfo.getId());
                    //查询学院id
                    Integer result=schoolInfoMapper.selectBySchoolId(scoreInfo.getSchoolName());
                    System.out.println("学院id："+result);
                    //查询班级id
                    Integer res = classInfoMapper.selectByClassId(scoreInfo.getClassName());
                    System.out.println("班级id："+ res);
                    //查询学生id
                    Integer integer = studentInfoMapper.selectByStudentId(scoreInfo.getStudentNumber());
                    System.out.println("学生id："+integer);

                    //插入总成绩表
                    scoreInfo.setSchoolInfoId(result);
                    scoreInfo.setClassInfoId(res);
                    scoreInfo.setStudentInfoId(integer);
                    scoreInfoList1.add(scoreInfo);
                }
                System.out.println("插入信息"+scoreInfoList1);
            }
            // 调用mapper层增加方法
            scoreInfoMapper.importExcelXLSXScore(scoreInfoList1);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
