package com.example.demo.entity;

import lombok.Data;

import java.util.Date;

/**
 * 成绩评估表
 */
@Data
public class AssessmentInfo {
    /**
     * 成绩评估标识
     */
    private Integer id;
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
     * 备注
     */
    private String remark;
    /**
     * 状态
     */
    private String state;
    /**
     * 状态时间
     */
    private Date stateData;
}