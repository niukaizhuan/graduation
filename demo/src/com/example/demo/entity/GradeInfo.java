package com.example.demo.entity;

import lombok.Data;

import java.util.Date;

/**
 * 年级实体类
 */
@Data
public class GradeInfo {
    private Integer id;

    private String gradeName;

    private String remark;

    private String state;

    private Date createdData;

}