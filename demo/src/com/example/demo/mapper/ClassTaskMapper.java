package com.example.demo.mapper;

import com.example.demo.entity.ClassTask;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClassTaskMapper {
    /**
     * 查询学院开课信息和id集合
     *
     * @return 学院开课信息和id集合
     */
    List<ClassTask> listClassTask();

    /**
     * 逻辑删除学院开课信息
     *
     * @param id 学院开课信息标识
     */
    void delete(Integer id);

    /**
     * 批量逻辑删除学院开课信息
     *
     * @param idList 需要删除的id的集合
     * @return 受影响行数
     */
    Integer deleteSelection(List<Integer> idList);

    /**
     * 获取当前传入的学院开课编码的总数，编辑时去除当前记录
     *
     * @param classTask
     * @return 查到的总数
     */
    Integer countByClassTask(ClassTask classTask);

    /**
     * 插入学院开课信息
     *
     * @param classTask 学院开课信息
     */
    void insert(ClassTask classTask);

    /**
     * 根据学院开课信息标识查询学院开课信息
     *
     * @param id 学院开课标识
     * @return 学院开课信息类
     */
    ClassTask selectById(Integer id);

    /**
     * 更新学院开课信息
     *
     * @param classTask 学院开课信息类
     */
    void update(ClassTask classTask);

    /**
     * 过滤查询学院开课信息
     *
     * @param classTask 学院开课信息类
     * @return 学院开课信息集合
     */
    List<ClassTask> listByClassTask(ClassTask classTask);

    /**
     * SELECT DISTINCT 语句用于返回唯一不同的值，在表中，一个列可能会包含多个重复值，有时我们希望仅仅列出不同（distinct）的值
     *
     * @param classId
     * @return
     */
    List<String> selectByColumnName(@Param("columnName") String columnName);

    /**
     * 通过学期获取开课任务
     *
     * @param classTask
     * @return
     */
    List<ClassTask> listByTermName(ClassTask classTask);
}