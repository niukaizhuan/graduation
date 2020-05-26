package com.example.demo.entity;

import lombok.Data;

import java.sql.Timestamp;

/**
 * 学院信息实体类
 */

@Data
public class SchoolInfo {
    /**
     * 学院信息标识
     */
    private Integer id;
    /**
     * 学院名称
     */
    private String schoolName;
    /**
     * 学院编码
     */
    private String schoolNo;
    /**
     * 备注
     */
    private String remark;
    /**
     * 状态时间
     */
    private Timestamp stateDate;
    /**
     * 状态码
     */
    private String state;

}