package com.example.demo.mapper;

import com.example.demo.entity.ScoreInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ScoreInfoMapper {
    /**
     * 查询成绩信息和id集合
     *
     * @return 成绩信息和id集合
     */
    List<ScoreInfo> listScoreInfo();

    /**
     * 逻辑删除成绩信息
     *
     * @param id 成绩信息标识
     */
    void delete(Integer id);

    /**
     * 批量逻辑删除成绩信息
     *
     * @param idList 需要删除的id的集合
     * @return 受影响行数
     */
    Integer deleteSelection(List<Integer> idList);

    /**
     * 获取当前传入的成绩编码的总数，编辑时去除当前记录
     *
     * @param ScoreInfo
     * @return 查到的总数
     */
    Integer countByScoreInfo(ScoreInfo scoreInfo);

    /**
     * 插入成绩信息
     *
     * @param ScoreInfo 成绩信息
     */
    void insert(ScoreInfo scoreInfo);

    /**
     * 根据成绩信息标识查询成绩信息
     *
     * @param id 成绩标识
     * @return 成绩信息类
     */
    ScoreInfo selectById(Integer id);

    /**
     * 更新成绩信息
     *
     * @param ScoreInfo 成绩信息类
     */
    void update(ScoreInfo scoreInfo);

    /**
     * 过滤查询成绩信息
     *
     * @param ScoreInfo 成绩信息类
     * @return 成绩信息集合
     */
    List<ScoreInfo> listByScoreInfo(ScoreInfo scoreInfo);

    /**
     * 批量查询考核项标识
     *
     * @param list
     * @return
     */
    List<Integer> listByAssessmentId(@Param("list") List<Integer> list);

    /**
     * 导出成绩
     *
     * @param scoreInfo
     * @return
     */
    List<ScoreInfo> exportScoreInfo(ScoreInfo scoreInfo);

    /**
     * Excel导入
     * @param scoreInfoList
     */
    void importExcelXLSXScore(@Param("list") List<ScoreInfo> scoreInfoList);
}