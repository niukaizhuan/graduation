package com.example.demo.mapper;

import com.example.demo.entity.TeachPlan;

public interface TeachPlanMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TeachPlan record);

    int insertSelective(TeachPlan record);

    TeachPlan selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TeachPlan record);

    int updateByPrimaryKey(TeachPlan record);
}