package com.example.demo.service;

import com.example.demo.entity.ClassroomInfo;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface ClassroomInfoService {
    /**
     * 查询教室信息和id集合
     *
     * @return 教室信息和id集合
     */
    List<ClassroomInfo> listClassroomInfo();

    /**
     * 逻辑删除教室信息
     *
     * @param id 教室信息标识
     */
    void delete(Integer id);

    /**
     * 批量逻辑删除教室信息
     *
     * @param idList 需要删除的id的集合
     * @return 受影响行数
     */
    Integer deleteSelection(List<Integer> idList);

    /**
     * 插入教室信息
     *
     * @param classroomInfo 教室信息
     */
    String insert(ClassroomInfo classroomInfo);


    /**
     * 更新教室信息
     *
     * @param classroomInfo 教室信息类
     */
    String update(ClassroomInfo classroomInfo);

    /**
     * 根据教室信息标识查询教室信息
     *
     * @param id 教室标识
     * @return 教室信息类
     */
    ClassroomInfo selectById(Integer id);

    /**
     * 过滤查询教室信息
     *
     * @param classroomInfo
     * @param pageNum
     * @param pageSize
     * @return
     */
    PageInfo<ClassroomInfo> listByClassroomInfo(ClassroomInfo classroomInfo, Integer pageNum, Integer pageSize);
}
