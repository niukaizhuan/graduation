package com.example.demo.entity;

import lombok.Data;

import java.sql.Timestamp;
import java.util.Date;

/**
 * 课程类别
 */
@Data
public class CourseType {
	/**
	 * 类别ID
	 */
    private Integer id;
    /**
     * 用户标识
     */
    private Integer userId;
    /**
     * 类别名称
     */
    private String typeName;
    /**
     * 类别编码
     */
    private String typeNo;
    /**
     * 创建时间
     */
    private Timestamp createdDate;
    
    private String pcreatedDate;
    /**
     * 审核状态
     */
    private String state;
    
    private String pstate;
    /**
     * 审核时间
     */
    private Timestamp stateDate;
    
    private String pstateDate;

	/**
	 * Mybatis判断数据库是否存在当前数据的依据
	 */
	private Integer count;
}