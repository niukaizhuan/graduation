package com.example.demo.entity;

import lombok.Data;

import java.util.Date;

/**
 * 教学楼信息
 */
@Data
public class TeachBuildInfo {
    /**
     * 教学楼标识
     */
    private Integer id;
    /**
     * 教学楼名称
     */
    private String teachBuildName;
    /**
     * 教学楼编号
     */
    private String teachBuildNumber;

    private String remark;

    private String state;

    private Date createdDate;



}