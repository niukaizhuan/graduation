package com.example.demo.service;

import com.example.demo.entity.ScoreInfo;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface ScoreInfoService {
    /**
     * 插入成绩信息
     *
     * @param scoreInfo 成绩信息类
     * @return 重复属性信息
     */
    String insert(ScoreInfo scoreInfo);

    /**
     * 更新成绩信息
     *
     * @param scoreInfo 成绩信息类
     * @return 重复属性信息
     */
    String update(ScoreInfo scoreInfo);

    /**
     * 删除成绩信息
     *
     * @param id 成绩信息标识
     */
    void delete(Integer id);

    /**
     * 批量逻辑删除成绩信息
     *
     * @param idList 需要删除的id的集合
     * @return 成功删除的记录数
     */
    Integer deleteSelection(List<Integer> idList);

    /**
     * 根据成绩信息标识查询成绩信息
     *
     * @param id 成绩标识
     * @return 成绩信息类
     */
    ScoreInfo selectById(Integer id);

    /**
     * 分页条件查询
     *
     * @param scoreInfo 需要作为查询条件的成绩信息类
     * @param pageNum   当前页索引
     * @param pageSize  设置分页参数
     * @return PageInfo分页数据
     */
    PageInfo<ScoreInfo> listByScoreInfo(ScoreInfo scoreInfo, Integer pageNum, Integer pageSize);

    /**
     * 导出成绩
     *
     * @param scoreInfo
     */
    void exportScoreInfo(ScoreInfo scoreInfo);

    /**
     * 导入成绩
     *
     * @param fileInfoId
     */
    void importExcelXLSXScore(Integer fileInfoId);
}
