package com.example.demo.entity;

import lombok.Data;

import java.util.Date;

/**
 * 教师课程安排信息
 */
@Data
public class TeacherCourse {
    /**
     * 教师课程安排标识
     */
    private Integer id;
    /**
     * 教师标识
     */
    private String staffNo;
    /**
     * 课程标识
     */
    private String courseNo;
    /**
     * 班级标识
     */
    private String classNo;
    /**
     * 教师标识
     */
    private String classroomNo;
    /**
     * 上课时间
     */
    private String classTime;

    private String remark;

    private String state;

    private Date stateDate;

    private String className;
    private String courseName;
    private String courseCode;
    private String staffName;
    private String staffCode;
    private String classroomNumber;
}