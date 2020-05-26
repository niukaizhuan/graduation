package com.example.demo.service.impl;

import com.example.demo.entity.CoursePlan;
import com.example.demo.mapper.CoursePlanMapper;
import com.example.demo.service.CoursePlanService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CoursePlanServiceImpl implements CoursePlanService {
    @Autowired
    private CoursePlanMapper coursePlanMapper;

    @Override
    public List<CoursePlan> listCoursePlan() {
        return coursePlanMapper.listCoursePlan();
    }

    @Override
    public void delete(Integer id) {
        coursePlanMapper.delete(id);
    }

    @Override
    public Integer deleteSelection(List<Integer> idList) {
        return coursePlanMapper.deleteSelection(idList);
    }

    @Override
    public void insert(CoursePlan coursePlan) {
        coursePlanMapper.insert(coursePlan);
    }

    @Override
    public void update(CoursePlan coursePlan) {
        coursePlanMapper.update(coursePlan);
    }

    @Override
    public CoursePlan selectById(Integer id) {
        return coursePlanMapper.selectById(id);
    }

    @Override
    public PageInfo<CoursePlan> listByCoursePlan(CoursePlan coursePlan, Integer pageNum, Integer pageSize) {
        // 设置分页参数
        PageHelper.startPage(pageNum, pageSize);
        // 查询集合
        List<CoursePlan> coursePlanList = coursePlanMapper.listByCoursePlan(coursePlan);
        System.out.println(coursePlanList);
        PageInfo<CoursePlan> planPageInfo = new PageInfo<>(coursePlanList);
        return planPageInfo;
    }

    @Override
    public List<CoursePlan> selectAll() {
        List<CoursePlan> list = coursePlanMapper.selectAll();
        System.out.println(list);
        return list;
    }
}
