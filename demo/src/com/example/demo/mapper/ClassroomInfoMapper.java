package com.example.demo.mapper;

import com.example.demo.entity.ClassroomInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClassroomInfoMapper {
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
     * 获取当前传入的教室编码的总数，编辑时去除当前记录
     *
     * @param classroomInfo
     * @return 查到的总数
     */
    Integer countByClassroomInfo(ClassroomInfo classroomInfo);

    /**
     * 插入教室信息
     *
     * @param classroomInfo 教室信息
     */
    void insert(ClassroomInfo classroomInfo);

    /**
     * 根据教室信息标识查询教室信息
     *
     * @param id 教室标识
     * @return 教室信息类
     */
    ClassroomInfo selectById(Integer id);

    /**
     * 更新教室信息
     *
     * @param classroomInfo 教室信息类
     */
    void update(ClassroomInfo classroomInfo);

    /**
     * 过滤查询教室信息
     *
     * @param classroomInfo 教室信息类
     * @return 教室信息集合
     */
    List<ClassroomInfo> listByClassroomInfo(ClassroomInfo classroomInfo);

    /**
     * 根据教学楼编码查询教室信息
     *
     * @param teachBuildNo
     * @return
     */
    List<ClassroomInfo> selectByTeachBuildNo(@Param("teachBuildNumber") String teachBuildNumber);
}