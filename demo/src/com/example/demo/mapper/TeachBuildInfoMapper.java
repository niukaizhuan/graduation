package com.example.demo.mapper;

import com.example.demo.entity.TeachBuildInfo;

import java.util.List;

public interface TeachBuildInfoMapper {
    /**
     * 查询教学楼信息和id集合
     *
     * @return 教学楼信息和id集合
     */
    List<TeachBuildInfo> listTeachBuildInfo();

    /**
     * 逻辑删除教学楼信息
     *
     * @param id 教学楼信息标识
     */
    void delete(Integer id);

    /**
     * 批量逻辑删除教学楼信息
     *
     * @param idList 需要删除的id的集合
     * @return 受影响行数
     */
    Integer deleteSelection(List<Integer> idList);

    /**
     * 获取当前传入的教学楼编码的总数，编辑时去除当前记录
     *
     * @param teachBuildInfo
     * @return 查到的总数
     */
    Integer countByTeachBuildInfo(TeachBuildInfo teachBuildInfo);

    /**
     * 插入教学楼信息
     *
     * @param teachBuildInfo 教学楼信息
     */
    void insert(TeachBuildInfo teachBuildInfo);

    /**
     * 根据教学楼信息标识查询教学楼信息
     *
     * @param id 教学楼标识
     * @return 教学楼信息类
     */
    TeachBuildInfo selectById(Integer id);

    /**
     * 更新教学楼信息
     *
     * @param teachBuildInfo 教学楼信息类
     */
    void update(TeachBuildInfo teachBuildInfo);

    /**
     * 过滤查询教学楼信息
     *
     * @param teachBuildInfo 教学楼信息类
     * @return 教学楼信息集合
     */
    List<TeachBuildInfo> listByTeachBuildInfo(TeachBuildInfo teachBuildInfo);
}