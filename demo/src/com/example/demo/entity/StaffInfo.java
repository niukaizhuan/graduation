package com.example.demo.entity;

import lombok.Data;

import java.sql.Timestamp;
import java.util.Date;

/**
 * 教工信息实体类
 */
@Data
public class StaffInfo {
    /**
     * 教师标识
     */
    private Integer id;

    /**
     * 教师姓名
     */
    private String staffName;

    /**
     * 教师编码
     */
    private String staffCode;

    /**
     * 用户标识
     */
    private Integer userId;

    /**
     * 生日
     */
    private Date birthday;

    /**
     * 生日
     */
    private String birthdayString;

    /**
     * 性别
     */
    private String sex;

    /**
     * 性别
     */
    private String sexString;

    /**
     * 创建时间
     */
    private Timestamp createdDate;

    /**
     * 状态时间
     */
    private Timestamp stateDate;

    /**
     * 状态
     */
    private String state;

    /**
     * Mybatis判断数据库是否存在当前数据的依据
     */
    private Integer count;

    /**
     * 学院编码
     */
    private String schoolNo;
    /**
     * 职称
     */
    private String title;

    private String schoolName;
}