package com.example.demo.mapper;

import com.example.demo.entity.CoursePlan;
import com.example.demo.entity.TeacherCourse;

import java.util.List;

public interface TeacherCourseMapper {
    /**
     * 查询老师课程楼信息和id集合
     *
     * @return 老师课程楼信息和id集合
     */
    List<TeacherCourse> listTeacherCourse();

    /**
     * 逻辑删除老师课程楼信息
     *
     * @param id 老师课程楼信息标识
     */
    void delete(Integer id);

    /**
     * 批量逻辑删除老师课程楼信息
     *
     * @param idList 需要删除的id的集合
     * @return 受影响行数
     */
    Integer deleteSelection(List<Integer> idList);

    /**
     * 获取当前传入的老师课程楼编码的总数，编辑时去除当前记录
     *
     * @param teacherCourse
     * @return 查到的总数
     */
    Integer countByTeacherCourse(TeacherCourse teacherCourse);

    /**
     * 插入老师课程楼信息
     *
     * @param teacherCourse 老师课程楼信息
     */
    void insert(TeacherCourse teacherCourse);

    /**
     * 根据老师课程楼信息标识查询老师课程楼信息
     *
     * @param id 老师课程楼标识
     * @return 老师课程楼信息类
     */
    TeacherCourse selectById(Integer id);

    /**
     * 更新老师课程楼信息
     *
     * @param teacherCourse 老师课程楼信息类
     */
    void update(TeacherCourse teacherCourse);

    /**
     * 过滤查询老师课程楼信息
     *
     * @param teacherCourse 老师课程楼信息类
     * @return 老师课程楼信息集合
     */
    List<TeacherCourse> listByTeacherCourse(TeacherCourse teacherCourse);

    /**
     * 将分配好时间和教室的对象更新到数据库中
     * @param coursePlan
     */
    void insertCoursePlan(CoursePlan coursePlan);
}