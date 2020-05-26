package com.example.demo.mapper;


import com.example.demo.entity.GradeInfo;

import java.util.List;

public interface GradeInfoMapper {

    /**
     * 查询年级id名称集合
     *
     * @return
     */
    List<GradeInfo> listByGradeInfo();

    int deleteByPrimaryKey(Integer id);

    int insert(GradeInfo record);

    int insertSelective(GradeInfo record);

    GradeInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GradeInfo record);

    int updateByPrimaryKey(GradeInfo record);

    /**
     * 通过名称获取id
     *
     * @param gradeName
     * @return
     */
    Integer selectByGradeId(String gradeName);
}