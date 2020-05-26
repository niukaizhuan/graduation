package com.example.demo.service;

import com.example.demo.entity.TeachBuildInfo;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface TeachBuildInfoService {
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
     * 插入教学楼信息
     *
     * @param teachBuildInfo 教学楼信息
     */
    String insert(TeachBuildInfo teachBuildInfo);


    /**
     * 更新教学楼信息
     *
     * @param teachBuildInfo 教学楼信息类
     */
    String update(TeachBuildInfo teachBuildInfo);

    /**
     * 根据教学楼信息标识查询教学楼信息
     *
     * @param id 教学楼标识
     * @return 教学楼信息类
     */
    TeachBuildInfo selectById(Integer id);

    /**
     * 过滤查询教学楼信息
     *
     * @param teachBuildInfo
     * @param pageNum
     * @param pageSize
     * @return
     */
    PageInfo<TeachBuildInfo> listByTeachBuildInfo(TeachBuildInfo teachBuildInfo, Integer pageNum, Integer pageSize);
}
