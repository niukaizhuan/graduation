package com.example.demo.entity;

import lombok.Data;

import java.util.Date;

/**
 * 题库实体类
 */
@Data
public class SubjectInfo {
    /**
     * 题目标识
     */
    private Integer id;
    /**
     *题目
     */
    private String subjectName;
    /**
     *选项A
     */
    private String optiona;
    /**
     *选项B
     */
    private String optionb;
    /**
     *选项C
     */
    private String optionc;
    /**
     *选项D
     */
    private String optiond;
    /**
     *正确答案
     */
    private String rightResult;
    /**
     *分值
     */
    private Integer subjectScore;
    /**
     *题目类型
     */
    private String subjectType;
    /**
     *课程标识
     */
    private Integer courseId;
    /**
     *年级标识
     */
    private Integer classInfoId;
    /**
     *难易程度
     */
    private String subjectEasy;
    /**
     * 备注
     */
    private String remark;
    /**
     *状态
     */
    private String state;
    /**
     *状态时间
     */
    private Date stateData;
    /**
     *创建时间
     */
    private Date createdData;

    /**
     * 转换后题目类型
     */
    private String typeSubject;
    /**
     *转换后难易程度
     */
    private String easySubject;

    /**
     * 课程名称
     */
    private String courseName;

    /**
     * 年级名称
     */
    private String gradeName;

}