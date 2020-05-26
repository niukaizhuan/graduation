package com.example.demo.service;

import com.example.demo.entity.ClassTask;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface ClassTaskService {
    /**
     * 查询开课任务信息和id集合
     *
     * @return 开课任务信息和id集合
     */
    List<ClassTask> listClassTask();

    /**
     * 逻辑删除开课任务信息
     *
     * @param id 开课任务信息标识
     */
    void delete(Integer id);

    /**
     * 批量逻辑删除开课任务信息
     *
     * @param idList 需要删除的id的集合
     * @return 受影响行数
     */
    Integer deleteSelection(List<Integer> idList);

    /**
     * 插入开课任务信息
     *
     * @param classTask 开课任务信息
     */
    void insert(ClassTask classTask);


    /**
     * 更新开课任务信息
     *
     * @param classTask 开课任务信息类
     */
    void update(ClassTask classTask);

    /**
     * 根据开课任务信息标识查询开课任务信息
     *
     * @param id 开课任务标识
     * @return 开课任务信息类
     */
    ClassTask selectById(Integer id);

    /**
     * 过滤查询开课任务信息
     *
     * @param classTask
     * @param pageNum
     * @param pageSize
     * @return
     */
    PageInfo<ClassTask> listByClassTask(ClassTask classTask, Integer pageNum, Integer pageSize);
}
