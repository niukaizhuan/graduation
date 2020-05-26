package com.example.demo.mapper;

import com.example.demo.entity.ClassInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClassInfoMapper {
    /**
     * 查询班级信息id和班级名称集合
     *
     * @return 班级信息id和班级名称集合
     */
    List<ClassInfo> selectClassInfoList();

    /**
     * 通过id逻辑删除班级信息
     *
     * @param id
     * @return
     */
    void delete(Integer id);

    /**
     * 批量逻辑删除班级信息
     *
     * @param idList 需要删除的id的集合
     * @return 受影响行数
     */
    Integer deleteSelection(List<Integer> idList);

    /**
     * 插入班级信息
     *
     * @param classInfo
     * @return
     */
    void insert(ClassInfo classInfo);

    /**
     * 根据班级信息标识查询学期信息
     *
     * @param id 标识
     * @return
     */
    ClassInfo selectById(Integer id);

    /**
     * 更新班级信息
     *
     * @param classInfo
     * @return
     */
    void update(ClassInfo classInfo);

    /**
     * 过滤查询班级信息
     *
     * @param classInfo 班级类
     * @return 班级信息集合
     */
    List<ClassInfo> listByClassInfo(ClassInfo classInfo);

    /**
     * 通过SpecialtyId查询班级id和班级名称集合
     *
     * @param classInfo 班级类
     * @return 班级信息集合
     */
    List<ClassInfo> listBySpecialtyId(ClassInfo classInfo);

    /**
     * 通过YearPlanId查询班级id和班级名称集合
     *
     * @param classInfo 班级类
     * @return 班级信息集合
     */
    List<ClassInfo> listByYearPlanId(ClassInfo classInfo);

    /**
     * 通过YearPlanId和SpecialtyId查询班级id和班级名称集合
     *
     * @param classInfo 班级类
     * @return 班级信息集合
     */
    List<ClassInfo> getClassNameByYearPlanIdSpecialtyId(ClassInfo classInfo);

    /**
     * 通过班级名称查询班级标识
     *
     * @param className
     * @return
     */
    Integer selectByClassId(String className);

    /**
     * 通过班级编号查询学生人数
     *
     * @param classNo
     * @return
     */
    int selectByStudentNumber(@Param("classNo") String classNo);
}