package com.example.demo.mapper;

import com.example.demo.entity.SchoolTeachBuildInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SchoolTeachBuildInfoMapper {
    /**
     * 查询学院教学楼信息和id集合
     *
     * @return 学院教学楼信息和id集合
     */
    List<SchoolTeachBuildInfo> listSchoolTeachBuildInfo();

    /**
     * 逻辑删除学院教学楼信息
     *
     * @param id 学院教学楼信息标识
     */
    void delete(Integer id);

    /**
     * 批量逻辑删除学院教学楼信息
     *
     * @param idList 需要删除的id的集合
     * @return 受影响行数
     */
    Integer deleteSelection(List<Integer> idList);

    /**
     * 获取当前传入的学院教学楼编码的总数，编辑时去除当前记录
     *
     * @param schoolTeachBuildInfo
     * @return 查到的总数
     */
    Integer countBySchoolTeachBuildInfo(SchoolTeachBuildInfo schoolTeachBuildInfo);

    /**
     * 插入学院教学楼信息
     *
     * @param schoolTeachBuildInfo 学院教学楼信息
     */
    void insert(SchoolTeachBuildInfo schoolTeachBuildInfo);

    /**
     * 根据学院教学楼信息标识查询学院教学楼信息
     *
     * @param id 学院教学楼标识
     * @return 学院教学楼信息类
     */
    SchoolTeachBuildInfo selectById(Integer id);

    /**
     * 更新学院教学楼信息
     *
     * @param schoolTeachBuildInfo 学院教学楼信息类
     */
    void update(SchoolTeachBuildInfo schoolTeachBuildInfo);

    /**
     * 过滤查询学院教学楼信息
     *
     * @param schoolTeachBuildInfo 学院教学楼信息类
     * @return 学院教学楼信息集合
     */
    List<SchoolTeachBuildInfo> listBySchoolTeachBuildInfo(SchoolTeachBuildInfo schoolTeachBuildInfo);


    /**
     * 通过学院查询教学楼编码
     *
     * @param schoolNo
     * @return
     */
    String selectByTeachBuildNo(@Param("schoolNo") String schoolNo);
}