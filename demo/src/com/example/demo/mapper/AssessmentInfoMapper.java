package com.example.demo.mapper;

import com.example.demo.entity.AssessmentInfo;

import java.util.List;

public interface AssessmentInfoMapper {
    /**
     * 查询评估信息和id集合
     *
     * @return 评估信息和id集合
     */
    List<AssessmentInfo> listAssessmentInfo();

    /**
     * 逻辑删除评估信息
     *
     * @param id 评估信息标识
     */
    void delete(Integer id);

    /**
     * 批量逻辑删除评估信息
     *
     * @param idList 需要删除的id的集合
     * @return 受影响行数
     */
    Integer deleteSelection(List<Integer> idList);

    /**
     * 获取当前传入的评估编码的总数，编辑时去除当前记录
     *
     * @param AssessmentInfo
     * @return 查到的总数
     */
    Integer countByAssessmentInfo(AssessmentInfo assessmentInfo);

    /**
     * 插入评估信息
     *
     * @param AssessmentInfo 评估信息
     */
    void insert(AssessmentInfo assessmentInfo);

    /**
     * 根据评估信息标识查询评估信息
     *
     * @param id 评估标识
     * @return 评估信息类
     */
    AssessmentInfo selectById(Integer id);

    /**
     * 更新评估信息
     *
     * @param AssessmentInfo 评估信息类
     */
    void update(AssessmentInfo assessmentInfo);

    /**
     * 过滤查询评估信息
     *
     * @param AssessmentInfo 评估信息类
     * @return 评估信息集合
     */
    List<AssessmentInfo> listByAssessmentInfo(AssessmentInfo assessmentInfo);
}