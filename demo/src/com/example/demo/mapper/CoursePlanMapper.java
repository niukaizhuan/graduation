package com.example.demo.mapper;

import com.example.demo.entity.ClassTask;
import com.example.demo.entity.CoursePlan;

import java.util.List;

public interface CoursePlanMapper {
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
     * 获取当前传入的课程计划编码的总数，编辑时去除当前记录
     *
     * @param coursePlan
     * @return 查到的总数
     */
    Integer countByCoursePlan(CoursePlan coursePlan);

    /**
     * 插入课程计划信息
     *
     * @param coursePlan 课程计划信息
     */
    void insert(CoursePlan coursePlan);

    /**
     * 根据课程计划信息标识查询课程计划信息
     *
     * @param id 课程计划标识
     * @return 课程计划信息类
     */
    CoursePlan selectById(Integer id);

    /**
     * 更新课程计划信息
     *
     * @param coursePlan 课程计划信息类
     */
    void update(CoursePlan coursePlan);

    /**
     * 过滤查询课程计划信息
     *
     * @param coursePlan 课程计划信息类
     * @return 课程计划信息集合
     */
    List<CoursePlan> listByCoursePlan(CoursePlan coursePlan);

    /**
     * 开课学期还有上课周数更新进上课计划表(course_plan)
     *
     * @param classTask
     */
    void updateCoursePlan(ClassTask classTask);

    /**
     * 查询所有
     */
    List<CoursePlan> selectAll();
}