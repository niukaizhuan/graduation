package com.example.demo.service;

import com.example.demo.entity.CoursePlan;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface CoursePlanService {
    /**
     * 查询课程计划信息和id集合
     *
     * @return 课程计划信息和id集合
     */
    List<CoursePlan> listCoursePlan();

    /**
     * 逻辑删除课程计划信息
     *
     * @param id 课程计划信息标识
     */
    void delete(Integer id);

    /**
     * 批量逻辑删除课程计划信息
     *
     * @param idList 需要删除的id的集合
     * @return 受影响行数
     */
    Integer deleteSelection(List<Integer> idList);

    /**
     * 插入课程计划信息
     *
     * @param coursePlan 课程计划信息
     */
    void insert(CoursePlan coursePlan);


    /**
     * 更新课程计划信息
     *
     * @param coursePlan 课程计划信息类
     */
    void update(CoursePlan coursePlan);

    /**
     * 根据课程计划信息标识查询课程计划信息
     *
     * @param id 课程计划标识
     * @return 课程计划信息类
     */
    CoursePlan selectById(Integer id);

    /**
     * 过滤查询课程计划信息
     *
     * @param coursePlan
     * @param pageNum
     * @param pageSize
     * @return
     */
    PageInfo<CoursePlan> listByCoursePlan(CoursePlan coursePlan, Integer pageNum, Integer pageSize);

    /**
     * 查询所有
     */
    List<CoursePlan> selectAll();
}
