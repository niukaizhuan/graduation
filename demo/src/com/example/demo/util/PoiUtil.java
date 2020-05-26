package com.example.demo.util;

import com.example.demo.entity.SchoolInfo;
import com.example.demo.entity.ScoreInfo;
import com.example.demo.entity.SubjectInfo;
import com.example.demo.mapper.ClassInfoMapper;
import com.example.demo.mapper.SchoolInfoMapper;
import com.example.demo.mapper.StudentInfoMapper;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * POI工具类
 */
public class PoiUtil {
    @Autowired
    private static SchoolInfoMapper schoolInfoMapper;
    @Autowired
    private static ClassInfoMapper classInfoMapper;
    @Autowired
    private static StudentInfoMapper studentInfoMapper;

    /**
     * poi导出.xls格式
     *
     * @param subjectInfoList
     * @throws Exception
     */
    public static void exportXLS(List<SubjectInfo> subjectInfoList) throws Exception {
        //指定数据存放的位置
        OutputStream outputStream = new FileOutputStream("D:\\test.xls");
        //1.创建一个工作簿
        HSSFWorkbook workbook = new HSSFWorkbook();
        //2.创建一个工作表sheet
        HSSFSheet sheet = workbook.createSheet("test");
        //List<VideoUser> userList = userService.selectAll();
        //构造参数依次表示起始行，截至行，起始列， 截至列
        CellRangeAddress region = new CellRangeAddress(0, 0, 0, 3);
        sheet.addMergedRegion(region);

        HSSFCellStyle style = workbook.createCellStyle();
        //水平居中
//        style.setAlignment(HorizontalAlignment.CENTER);
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        //垂直居中
//        style.setVerticalAlignment(VerticalAlignment.CENTER);
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);

        HSSFRow row1 = sheet.createRow(0);
        HSSFCell cell = row1.createCell(0);
        //设置值，这里合并单元格后相当于标题
        cell.setCellValue("题库信息表");
        //将样式添加生效
        cell.setCellStyle(style);

        for (int i = 0; i < subjectInfoList.size(); i++) {
            //行
            HSSFRow row = sheet.createRow(i + 1);
            //对列赋值
            row.createCell(0).setCellValue(subjectInfoList.get(i).getId());
            row.createCell(1).setCellValue(subjectInfoList.get(i).getSubjectName());
            row.createCell(2).setCellValue(subjectInfoList.get(i).getOptiona());
            row.createCell(3).setCellValue(subjectInfoList.get(i).getOptionb());
            row.createCell(4).setCellValue(subjectInfoList.get(i).getOptionc());
            row.createCell(5).setCellValue(subjectInfoList.get(i).getOptiond());
        }
        workbook.write(outputStream);
        outputStream.close();
    }

    /**
     * poi导出题库.xlsx格式
     *
     * @param subjectInfoList
     * @throws Exception
     */
    public static void exportXLSX(List<SubjectInfo> subjectInfoList) throws Exception {
        //指定数据存放的位置
        OutputStream outputStream = new FileOutputStream("D:\\test04.xlsx");
        //1.创建一个工作簿
        XSSFWorkbook workbook = new XSSFWorkbook();
        //2.创建一个工作表sheet
        XSSFSheet sheet = workbook.createSheet("test");
        //构造参数依次表示起始行，截至行，起始列， 截至列
        CellRangeAddress region = new CellRangeAddress(0, 0, 0, 10);
        sheet.addMergedRegion(region);

        XSSFCellStyle style = workbook.createCellStyle();
        //水平居中
        style.setAlignment(HorizontalAlignment.CENTER);
        //垂直居中
        style.setVerticalAlignment(VerticalAlignment.CENTER);
        XSSFRow row1 = sheet.createRow(0);
        XSSFCell cell = row1.createCell(0);
        //设置值，这里合并单元格后相当于标题
        cell.setCellValue("表名");
        //将样式添加生效
        cell.setCellStyle(style);

        for (int i = 0; i < subjectInfoList.size(); i++) {
            //行
            XSSFRow row = sheet.createRow(i + 1);
            //对列赋值
            row.createCell(0).setCellValue(subjectInfoList.get(i).getId());
            row.createCell(1).setCellValue(subjectInfoList.get(i).getSubjectName());
            row.createCell(2).setCellValue(subjectInfoList.get(i).getOptiona());
            row.createCell(3).setCellValue(subjectInfoList.get(i).getOptionb());
            row.createCell(4).setCellValue(subjectInfoList.get(i).getOptionc());
            row.createCell(5).setCellValue(subjectInfoList.get(i).getOptiond());
            row.createCell(6).setCellValue(subjectInfoList.get(i).getRightResult());
            row.createCell(7).setCellValue(subjectInfoList.get(i).getSubjectScore());
            if (subjectInfoList.get(i).getSubjectType().equals("A")) {
                row.createCell(8).setCellValue("选择题");
            } else {
                row.createCell(8).setCellValue(subjectInfoList.get(i).getSubjectType());
            }
            if (subjectInfoList.get(i).getSubjectEasy().equals("A")) {
                row.createCell(9).setCellValue("简单");
            } else {
                row.createCell(9).setCellValue(subjectInfoList.get(i).getSubjectEasy());
            }
//            row.createCell(8).setCellValue(subjectInfoList.get(i).getSubjectType());
//            row.createCell(9).setCellValue(subjectInfoList.get(i).getSubjectEasy());
            row.createCell(10).setCellValue(subjectInfoList.get(i).getCourseName());
            row.createCell(11).setCellValue(subjectInfoList.get(i).getGradeName());
        }
        workbook.write(outputStream);
        outputStream.close();
    }

    /**
     * poi导入.xls格式
     *
     * @return
     * @throws Exception
     */
    public static List<SubjectInfo> importExcelXLS(String path) throws Exception {
        HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(new File(path)));
        HSSFSheet sheet = null;
        for (int i = 0; i < workbook.getNumberOfSheets(); i++) {
            //获取每个sheet
            sheet = workbook.getSheetAt(i);
            List<SubjectInfo> list = new ArrayList<SubjectInfo>();
            //getPhysicalNumberOfRows获取有记录的行数
            for (int j = 0; j < sheet.getPhysicalNumberOfRows(); j++) {
                Row row = sheet.getRow(j);
                if (null != row) {
                    //getLastCellNum获取最后一列
                    SubjectInfo subjectInfo = new SubjectInfo();
                    for (int k = 0; k < row.getLastCellNum(); k++) {
                        if (null != row.getCell(k)) {
                            if (k == 0) {
                                Cell cell = row.getCell(0);
                                subjectInfo.setId((int) cell.getNumericCellValue());
                            }
                            if (k == 1) {
                                Cell cell = row.getCell(1);
                                //cell->string
                                subjectInfo.setSubjectName(cell.getStringCellValue().toString());
                            }
                            if (k == 2) {
                                Cell cell = row.getCell(2);
                                subjectInfo.setOptiona(cell.getStringCellValue().toString());
                            }
                            if (k == 3) {
                                Cell cell = row.getCell(3);
                                subjectInfo.setOptionb(cell.getStringCellValue().toString());
                            }
                            if (k == 4) {
                                Cell cell = row.getCell(4);
                                subjectInfo.setOptionc(cell.getStringCellValue().toString());
                            }
                            if (k == 5) {
                                Cell cell = row.getCell(5);
                                subjectInfo.setOptiond(cell.getStringCellValue().toString());
                            }
                            if (k == 6) {
                                Cell cell = row.getCell(6);
                                subjectInfo.setRightResult(cell.getStringCellValue().toString());
                            }
                            if (k == 7) {
                                Cell cell = row.getCell(7);
                                subjectInfo.setSubjectScore((int) cell.getNumericCellValue());
                            }
                            if (k == 8) {
                                Cell cell = row.getCell(8);
                                if (cell.getStringCellValue().toString().equals("简单")) {
                                    subjectInfo.setSubjectEasy("A");
                                }
                                if (cell.getStringCellValue().toString().equals("一般")) {
                                    subjectInfo.setSubjectEasy("B");
                                }
                                if (cell.getStringCellValue().toString().equals("困难")) {
                                    subjectInfo.setSubjectEasy("C");
                                }
                                if (cell.getStringCellValue().toString().equals("非常困难")) {
                                    subjectInfo.setSubjectEasy("D");
                                }
                            }
                            if (k == 9) {
                                Cell cell = row.getCell(9);
                                if (cell.getStringCellValue().toString().equals("选择题")) {
                                    subjectInfo.setSubjectType("A");
                                }
                                if (cell.getStringCellValue().toString().equals("填空题")) {
                                    subjectInfo.setSubjectType("B");
                                }
                                if (cell.getStringCellValue().toString().equals("判断题")) {
                                    subjectInfo.setSubjectType("C");
                                }
                            }
                        }

                    }
                    list.add(subjectInfo);
                }
            }
            System.out.println("读取sheet表：" + workbook.getSheetName(i) + "完成");
            return list;
        }

        return null;
    }


    /**
     * poi导入题库.xlsx格式
     *
     * @return
     * @throws Exception
     */
    public static List<SubjectInfo> importExcelXLSX(String path) throws Exception {
        XSSFWorkbook workbook = new XSSFWorkbook(new FileInputStream(new File(path)));
        XSSFSheet sheet = null;
        for (int i = 0; i < workbook.getNumberOfSheets(); i++) {
            //获取每个sheet
            sheet = workbook.getSheetAt(i);
            List<SubjectInfo> list = new ArrayList<SubjectInfo>();
            //getPhysicalNumberOfRows获取有记录的行数
            for (int j = 1; j < sheet.getPhysicalNumberOfRows(); j++) {
                Row row = sheet.getRow(j);
                if (null != row) {
                    //getLastCellNum获取最后一列
                    SubjectInfo subjectInfo = new SubjectInfo();
                    for (int k = 0; k < row.getLastCellNum(); k++) {
                        if (null != row.getCell(k)) {
                            if (k == 0) {
                                Cell cell = row.getCell(0);
                                subjectInfo.setId((int) cell.getNumericCellValue());
                            }
                            if (k == 1) {
                                Cell cell = row.getCell(1);
                                //cell->string
                                subjectInfo.setSubjectName(cell.getStringCellValue().toString());
                            }
                            if (k == 2) {
                                Cell cell = row.getCell(2);
                                subjectInfo.setOptiona(cell.getStringCellValue().toString());
                            }
                            if (k == 3) {
                                Cell cell = row.getCell(3);
                                subjectInfo.setOptionb(cell.getStringCellValue().toString());
                            }
                            if (k == 4) {
                                Cell cell = row.getCell(4);
                                subjectInfo.setOptionc(cell.getStringCellValue().toString());
                            }
                            if (k == 5) {
                                Cell cell = row.getCell(5);
                                subjectInfo.setOptiond(cell.getStringCellValue().toString());
                            }
                            if (k == 6) {
                                Cell cell = row.getCell(6);
                                subjectInfo.setRightResult(cell.getStringCellValue().toString());
                            }
                            if (k == 7) {
                                Cell cell = row.getCell(7);
                                subjectInfo.setSubjectScore((int) cell.getNumericCellValue());
                            }
                            if (k == 8) {
                                Cell cell = row.getCell(8);
                                if (cell.getStringCellValue().toString().equals("选择题")) {
                                    subjectInfo.setSubjectType("A");
                                }
                                if (cell.getStringCellValue().toString().equals("填空题")) {
                                    subjectInfo.setSubjectType("B");
                                }
                                if (cell.getStringCellValue().toString().equals("判断题")) {
                                    subjectInfo.setSubjectType("C");
                                }
                            }
                            if (k == 9) {
                                Cell cell = row.getCell(9);
                                if (cell.getStringCellValue().toString().equals("简单")) {
                                    subjectInfo.setSubjectEasy("A");
                                }
                                if (cell.getStringCellValue().toString().equals("一般")) {
                                    subjectInfo.setSubjectEasy("B");
                                }
                                if (cell.getStringCellValue().toString().equals("困难")) {
                                    subjectInfo.setSubjectEasy("C");
                                }
                                if (cell.getStringCellValue().toString().equals("非常困难")) {
                                    subjectInfo.setSubjectEasy("D");
                                }
                            }
                            if (k == 10) {
                                Cell cell = row.getCell(10);
                                subjectInfo.setCourseName(cell.getStringCellValue().toString());
                            }
                            if (k == 11) {
                                Cell cell = row.getCell(11);
                                subjectInfo.setGradeName(cell.getStringCellValue().toString());
                            }
                        }

                    }
                    list.add(subjectInfo);
                }
            }
            System.out.println("读取sheet表：" + workbook.getSheetName(i) + "完成");
            System.out.println("解析结果" + list);
            return list;
        }

        return null;
    }

    /**
     * POI导出成绩（.XLSX格式）
     *
     * @param scoreInfoList
     * @return
     */
    public static void exportXLSScoreInfo(List<ScoreInfo> scoreInfoList) throws Exception {
        //指定数据存放的位置
        OutputStream outputStream = new FileOutputStream("D:\\test10.xlsx");
        //1.创建一个工作簿
        XSSFWorkbook workbook = new XSSFWorkbook();
        //2.创建一个工作表sheet（起名test）
        XSSFSheet sheet = workbook.createSheet("test");
        //表格样式
        XSSFCellStyle style = workbook.createCellStyle();
        //水平居中
        style.setAlignment(HorizontalAlignment.CENTER);
        //垂直居中
        style.setVerticalAlignment(VerticalAlignment.CENTER);
        //创建标题栏
        XSSFRow titleRow = sheet.createRow(0);
        //设置表头栏
        String title[] = {"序号", "学院", "班级", "姓名", "学号", "作业考核", "实践考核", "实验考核", "期末考核", "总成绩", "学生状态", "备注"};
        //构造参数依次表示起始行，截至行，起始列， 截至列
        CellRangeAddress region = new CellRangeAddress(0, 0, 0, title.length);
        sheet.addMergedRegion(region);
        //设置标题列
        XSSFCell titleCell = titleRow.createCell(0);
        //设置名称
        titleCell.setCellValue("成绩单");
        //添加样式
        titleCell.setCellStyle(style);

        XSSFRow row1 = sheet.createRow(1);
        //设置表头
        for (int i = 0; i < title.length; i++) {
            XSSFCell cell = row1.createCell(i);
            //设置值
            cell.setCellValue(title[i]);
            //设置样式
            cell.setCellStyle(style);
        }
        if (null != scoreInfoList && scoreInfoList.size() > 0) {
            //在表中赋值
            for (int i = 0; i < scoreInfoList.size(); i++) {
                //行
                XSSFRow row = sheet.createRow(i + 2);
                //对列赋值
                row.createCell(0).setCellValue(scoreInfoList.get(i).getId());
                row.createCell(1).setCellValue(scoreInfoList.get(i).getSchoolName());
                row.createCell(2).setCellValue(scoreInfoList.get(i).getClassName());
                row.createCell(3).setCellValue(scoreInfoList.get(i).getStudentName());
                row.createCell(4).setCellValue(scoreInfoList.get(i).getStudentNumber());
                row.createCell(5).setCellValue(scoreInfoList.get(i).getHomeworkAssessment());
                row.createCell(6).setCellValue(scoreInfoList.get(i).getPracticalExamination());
                row.createCell(7).setCellValue(scoreInfoList.get(i).getExperimentalExamination());
                row.createCell(8).setCellValue(scoreInfoList.get(i).getFinalExamination());
                row.createCell(9).setCellValue(
                        scoreInfoList.get(i).getExperimentalExamination() * 0.2
                                + scoreInfoList.get(i).getHomeworkAssessment() * 0.1
                                + scoreInfoList.get(i).getPracticalExamination() * 0.1
                                + scoreInfoList.get(i).getFinalExamination() * 0.6);
                if (scoreInfoList.get(i).getStudentState().equals("A")) {
                    row.createCell(10).setCellValue("通过");
                }
                if (scoreInfoList.get(i).getStudentState().equals("B")) {
                    row.createCell(10).setCellValue("补考");
                }
                if (scoreInfoList.get(i).getStudentState().equals("C")) {
                    row.createCell(10).setCellValue("重修");
                }
                row.createCell(11).setCellValue(scoreInfoList.get(i).getRemark());
            }
        } else {
            System.out.println("没有数据");
        }
        workbook.write(outputStream);
        outputStream.close();
    }

    /**
     * poi导入成绩.xlsx格式
     *
     * @return
     * @throws Exception
     */
    public static List<ScoreInfo> importExcelXLSXScore(String path) throws Exception {
        //创建工作表
        XSSFWorkbook workbook = new XSSFWorkbook(new FileInputStream(new File(path)));
        XSSFSheet sheet = null;
        for (int i = 0; i < workbook.getNumberOfSheets(); i++) {
            //获取每个sheet
            sheet = workbook.getSheetAt(i);
            List<ScoreInfo> list = new ArrayList<ScoreInfo>();
            //getPhysicalNumberOfRows获取有记录的行数
            for (int j = 2; j < sheet.getPhysicalNumberOfRows(); j++) {
                Row row = sheet.getRow(j);
                if (null != row) {
                    ScoreInfo scoreInfo = new ScoreInfo();
                    //getLastCellNum获取最后一列
                    for (int k = 0; k < row.getLastCellNum(); k++) {
                        if (null != row.getCell(k)) {
                            if (k == 0) {
                                Cell cell = row.getCell(0);
                                scoreInfo.setId((int) cell.getNumericCellValue());
                            }
                            if (k == 1) {
                                Cell cell = row.getCell(1);
                                //cell->string
                                //得到学院名称
                                scoreInfo.setSchoolName(cell.getStringCellValue().toString());
                            }
                            if (k == 2) {
                                Cell cell = row.getCell(2);
                                scoreInfo.setClassName(cell.getStringCellValue().toString());
                            }
                            if (k == 4) {
                                Cell cell = row.getCell(4);
                                scoreInfo.setStudentNumber(cell.getStringCellValue().toString());
                            }
                            if (k == 5) {
                                Cell cell = row.getCell(5);
                                scoreInfo.setHomeworkAssessment((int) cell.getNumericCellValue());
                            }
                            if (k == 6) {
                                Cell cell = row.getCell(6);
                                scoreInfo.setPracticalExamination((int) cell.getNumericCellValue());
                            }
                            if (k == 7) {
                                Cell cell = row.getCell(7);
                                scoreInfo.setExperimentalExamination((int) cell.getNumericCellValue());
                            }
                            if (k == 8) {
                                Cell cell = row.getCell(8);
                                scoreInfo.setFinalExamination((int) cell.getNumericCellValue());
                            }
                            if (k == 10) {
                                Cell cell = row.getCell(10);
                                if (cell.getStringCellValue().toString().equals("通过")) {
                                    scoreInfo.setStudentState("A");
                                }
                                if (cell.getStringCellValue().toString().equals("补考")) {
                                    scoreInfo.setStudentState("B");
                                }
                                if (cell.getStringCellValue().toString().equals("重修")) {
                                    scoreInfo.setStudentState("C");
                                }
                            }
                            if (k == 11) {
                                Cell cell = row.getCell(11);
                                scoreInfo.setRemark(cell.getStringCellValue().toString());
                            }
                        }

                    }
                    list.add(scoreInfo);
                }
            }
            System.out.println("读取sheet表：" + workbook.getSheetName(i) + "完成");
            System.out.println("解析结果" + list);
            return list;
        }
        return null;
    }

    public static List<ScoreInfo> importExcelXLSScore(String path) {
        return null;
    }
}
