package com.example.demo.service;

import com.example.demo.entity.TeacherCourse;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface TeacherCourseService {
    /**
     * 查询教师课程安排信息和id集合
     *
     * @return 教师课程安排信息和id集合
     */
    List<TeacherCourse> listTeacherCourse();

    /**
     * 逻辑删除教师课程安排信息
     *
     * @param id 教师课程安排信息标识
     */
    void delete(Integer id);

    /**
     * 批量逻辑删除教师课程安排信息
     *
     * @param idList 需要删除的id的集合
     * @return 受影响行数
     */
    Integer deleteSelection(List<Integer> idList);

    /**
     * 插入教师课程安排信息
     *
     * @param teacherCourse 教师课程安排信息
     */
    void insert(TeacherCourse teacherCourse);


    /**
     * 更新教师课程安排信息
     *
     * @param teacherCourse 教师课程安排信息类
     */
    void update(TeacherCourse teacherCourse);

    /**
     * 根据教师课程安排信息标识查询教师课程安排信息
     *
     * @param id 教师课程安排标识
     * @return 教师课程安排信息类
     */
    TeacherCourse selectById(Integer id);

    /**
     * 过滤查询教师课程安排信息
     *
     * @param teacherCourse
     * @param pageNum
     * @param pageSize
     * @return
     */
    PageInfo<TeacherCourse> listByTeacherCourse(TeacherCourse teacherCourse, Integer pageNum, Integer pageSize);
}
