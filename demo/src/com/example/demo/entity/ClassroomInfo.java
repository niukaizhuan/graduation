package com.example.demo.entity;

import lombok.Data;

import java.util.Date;

/**
 * 教室信息实体类
 */
@Data
public class ClassroomInfo {
    /**
     * 教室信息标识
     */
    private Integer id;
    /**
     * 教学楼标识
     */
    private String teachBuildNumber;
    /**
     * 教室编号
     */
    private String classroomNumber;
    /**
     * 容纳人数
     */
    private Integer capacity;
    /**
     * 教室属性
     */
    private String classroomAttr;
    /**
     * 备注
     */
    private String remark;
    /**
     * 状态
     */
    private String state;

    private Date stateDate;

    private String teachBuildName;
}