package com.example.demo.service;

import com.example.demo.entity.SchoolTeachBuildInfo;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface SchoolTeachBuildInfoService {
    /**
     * 查询学院教学区安排信息和id集合
     *
     * @return 学院教学区安排信息和id集合
     */
    List<SchoolTeachBuildInfo> listSchoolTeachBuildInfo();

    /**
     * 逻辑删除学院教学区安排信息
     *
     * @param id 学院教学区安排信息标识
     */
    void delete(Integer id);

    /**
     * 批量逻辑删除学院教学区安排信息
     *
     * @param idList 需要删除的id的集合
     * @return 受影响行数
     */
    Integer deleteSelection(List<Integer> idList);

    /**
     * 插入学院教学区安排信息
     *
     * @param schoolTeachBuildInfo 学院教学区安排信息
     */
    void insert(SchoolTeachBuildInfo schoolTeachBuildInfo);


    /**
     * 更新学院教学区安排信息
     *
     * @param schoolTeachBuildInfo 学院教学区安排信息类
     */
    void update(SchoolTeachBuildInfo schoolTeachBuildInfo);

    /**
     * 根据学院教学区安排信息标识查询学院教学区安排信息
     *
     * @param id 学院教学区安排标识
     * @return 学院教学区安排信息类
     */
    SchoolTeachBuildInfo selectById(Integer id);

    /**
     * 过滤查询学院教学区安排信息
     *
     * @param schoolTeachBuildInfo
     * @param pageNum
     * @param pageSize
     * @return
     */
    PageInfo<SchoolTeachBuildInfo> listBySchoolTeachBuildInfo(SchoolTeachBuildInfo schoolTeachBuildInfo, Integer pageNum, Integer pageSize);
}
