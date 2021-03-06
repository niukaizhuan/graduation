package com.example.demo.entity;

import lombok.Data;

import java.util.Date;

/**
 * 学院开课任务书
 */
@Data
public class ClassTask {
    /**
     * 开课任务标识
     */
    private Integer id;
    /**
     * 学期名称
     */
    private String termName;

    /**
     * 班级编码
     */
    private String classNo;

    /**
     * 课程编码
     */
    private String courseNo;
    /**
     * 教室编码
     */
    private String staffNo;
    /**
     * 学院编码
     */
    private String schoolNo;
    /**
     * 学生人数
     */
    private Integer studentSum;

    /**
     * 课程性质
     */
    private String courseAttr;

    /**
     * 上课总时长
     */
    private Integer weeksSum;
    /**
     * 上课时长
     */
    private Integer weeksNumber;
    /**
     * 上课时间
     */
    private String classTime;
    /**
     * 是否固定
     */
    private String isFix;

    private String remark;

    private String state;

    private Date stateDate;

//    private String termName;
    private String schoolName;
    private String className;
    private String courseName;
    private String courseCode;
    private String staffName;
    private String staffCode;
    private String typeName;



}