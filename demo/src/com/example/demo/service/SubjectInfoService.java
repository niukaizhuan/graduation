package com.example.demo.service;


import com.example.demo.entity.GradeInfo;
import com.example.demo.entity.SubjectInfo;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface SubjectInfoService {

    /**
     * 查询题库信息和id集合
     *
     * @return 题库信息和id集合
     */
    List<SubjectInfo> listSubjectInfo();

    /**
     * 插入题库信息
     *
     * @param SubjectInfo 题库信息类
     * @return 重复属性信息
     */
    String insert(SubjectInfo subjectInfo);

    /**
     * 更新题库信息
     *
     * @param SubjectInfo 题库信息类
     * @return 重复属性信息
     */
    String update(SubjectInfo subjectInfo);

    /**
     * 删除题库信息
     *
     * @param id 题库信息标识
     */
    void delete(Integer id);

    /**
     * 批量逻辑删除题库信息
     *
     * @param idList 需要删除的id的集合
     * @return 成功删除的记录数
     */
    Integer deleteSelection(List<Integer> idList);

    /**
     * 根据题库信息标识查询题库信息
     *
     * @param id 题库标识
     * @return 题库信息类
     */
    SubjectInfo selectById(Integer id);

    /**
     * 分页条件查询
     *
     * @param SubjectInfo 需要作为查询条件的题库信息类
     * @param pageNum     当前页索引
     * @param pageSize    设置分页参数
     * @return PageInfo分页数据
     */
    PageInfo<SubjectInfo> listBySubjectInfo(SubjectInfo subjectInfo, Integer pageNum, Integer pageSize);

    /**
     * 批量导入Excel
     *
     * @param fileInfoId
     */
    void insertByExcel(Integer fileInfoId);

    /**
     * 测试导入Excel
     *
     * @return
     */
    int insertData(List<SubjectInfo> subjectInfoList);

    /**
     * 查询所有题目
     *
     * @return
     */
    List<SubjectInfo> selectAll();

    /**
     * 查询年级名称和id集合
     * @return
     */
    List<GradeInfo> listGradeInfo();

    /**
     * 通过课程id查询题目
     * @param courseId
     * @param n
     * @return
     */
	List<SubjectInfo> listByCourseId(Integer courseId, Integer n);
}
