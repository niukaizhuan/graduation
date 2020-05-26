package com.example.demo.entity;

import lombok.Data;

import java.util.Date;

/**
 * 课程计划实体类
 */
@Data
public class CoursePlan {
    /**
     * 课程计划标识
     */
    private Integer id;
    /**
     * 学院编码
     */
    private String schoolNo;
    /**
     * 班级编码
     */
    private String classNo;
    /**
     * 课程编码
     */
    private String courseNo;
    /**
     * 教师编码
     */
    private String staffNo;
    /**
     * 教室编码
     */
    private String classroomNo;
    /**
     * 学期名称
     */
    private String termName;
    /**
     *
     */
    private Integer weeksSum;
    /**
     * 上课时间
     */
    private String classTime;

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
    private String classroomNumber;
    private String teachBuildName;

}