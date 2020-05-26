package com.example.demo.entity;

import lombok.Data;

import java.util.Date;

/**
 * 教学计划
 */
@Data
public class TeachPlan {
    private Integer id;

    private String termName;

    private String classNo;

    private String courseNo;

    private String schoolNo;

    private Integer studentNumber;

    private String courseAttr;

    private Integer classHour;

    private Integer weeksNumber;

    private Integer weeksSum;

    private String remark;

    private String state;

    private Date stateDate;
}