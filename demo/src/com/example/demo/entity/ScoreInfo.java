package com.example.demo.entity;

import lombok.Data;

import java.util.Date;

/**
 * 成绩表
 */
@Data
public class ScoreInfo {
    /**
     * 成绩标识
     */
    private Integer id;
    /**
     * 学院标识
     */
    private Integer schoolInfoId;
    /**
     * 班级标识
     */
    private Integer classInfoId;
    /**
     * 学生标识
     */
    private Integer studentInfoId;
    /**
     * 评估考核标识
     */
    private Integer assessmentInfoId;
    /**
     * 学生状态
     */
    private String studentState;
    /**
     * 备注
     */
    private String remark;
    /**
     * 状态
     */
    private String state;

    private Date stateData;

    private Date createdData;

    /**
     * 期末考核
     */
    private Integer finalExamination;
    /**
     * 实践考核
     */
    private Integer practicalExamination;
    /**
     * 实验报告
     */
    private Integer experimentalExamination;
    /**
     * 平时作业
     */
    private Integer homeworkAssessment;
    /**
     * 学院名称
     */
    private String schoolName;
    /**
     * 班级名称
     */
    private String className;
    /**
     * 学生姓名
     */
    private String studentName;
    /**
     * 学生学号
     */
    private String studentNumber;
    /**
     * 总成绩
     */
    private double score;

}