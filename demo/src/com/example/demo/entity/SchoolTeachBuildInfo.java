package com.example.demo.entity;

import lombok.Data;

import java.util.Date;

/**
 * 学院教学区域安排位置信息表
 */
@Data
public class SchoolTeachBuildInfo {
    /**
     * 学院教学区安排标识
     */
    private Integer id;
    /**
     * 学院标识
     */
    private String schoolNo;
    /**
     * 教学楼标识
     */
    private String teachBuildNo;

    private String remark;

    private String state;

    private Date stateDate;

    private String schoolName;
    private String teachBuildName;
    private String teachBuildNumber;

}