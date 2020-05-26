package com.example.demo.mapper;

import com.example.demo.entity.SubjectInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SubjectInfoMapper {
    /**
     * 查询题库信息和id集合
     *
     * @return 题库信息和id集合
     */
    List<SubjectInfo> listSubjectInfo();

    /**
     * 逻辑删除题库信息
     *
     * @param id 题库信息标识
     */
    void delete(Integer id);

    /**
     * 批量逻辑删除题库信息
     *
     * @param idList 需要删除的id的集合
     * @return 受影响行数
     */
    Integer deleteSelection(List<Integer> idList);

    /**
     * 获取当前传入的题库编码的总数，编辑时去除当前记录
     *
     * @param SubjectInfo
     * @return 查到的总数
     */
    Integer countBySubjectInfo(SubjectInfo subjectInfo);

    /**
     * 插入题库信息
     *
     * @param SubjectInfo 题库信息
     */
    void insert(SubjectInfo subjectInfo);

    /**
     * 根据题库信息标识查询题库信息
     *
     * @param id 题库标识
     * @return 题库信息类
     */
    SubjectInfo selectById(Integer id);

    /**
     * 更新题库信息
     *
     * @param SubjectInfo 题库信息类
     */
    void update(SubjectInfo subjectInfo);

    /**
     * 过滤查询题库信息
     *
     * @param SubjectInfo 题库信息类
     * @return 题库信息集合
     */
    List<SubjectInfo> listBySubjectInfo(SubjectInfo subjectInfo);

    /**
     * poi导出Excel
     *
     * @param subjectInfoList
     */
    void insertByExcelList(@Param("subjectInfoList") List<SubjectInfo> subjectInfoList);

    /**
     * 导入Excel
     *
     * @param subjectInfoList
     * @return
     */
    int insertData(@Param("list") List<SubjectInfo> subjectInfoList);

    /**
     * 查询所有题目
     *
     * @return
     */
    List<SubjectInfo> selectAll();

    /**
     * 通过课程id查询题目
     * @param courseId
     * @param n
     * @return
     */
	List<SubjectInfo> listByCourseId(@Param("courseId") Integer courseId, @Param("n") Integer n);


}