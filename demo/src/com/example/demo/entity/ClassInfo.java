package com.example.demo.entity;

import lombok.Data;

import java.sql.Timestamp;

/**
 * 班级实体类
 */
@Data
public class ClassInfo {
    /**
     * 班级标识
     */
    private Integer id;

    /**
     * 班级名称
     */
    private String className;
    /**
     * 班级编码
     */
    private String classNo;
    /**
     * 班级人数
     */
    private Integer studentNumber;
    /**
     * 专业标识
     */
    private Integer specialtyId;
    /**
     * 年份标识
     */
    private Integer yearPlanId;
    /**
     * 备注
     */
    private String remark;

    private Timestamp createdDate;

    private Timestamp stateDate;

    private String state;
    /**
     * 专业名称
     */
    private String subjectName;
    /**
     * 年份名称
     */
    private String yearName;

    /**
     * Mybatis判断数据库是否存在当前数据的依据
     */
    private Integer count;


}