package com.example.demo.service.impl;

import com.example.demo.entity.TeachBuildInfo;
import com.example.demo.mapper.TeachBuildInfoMapper;
import com.example.demo.service.TeachBuildInfoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeachBuildInfoServiceImpl implements TeachBuildInfoService {
    @Autowired
    private TeachBuildInfoMapper teachBuildInfoMapper;

    @Override
    public List<TeachBuildInfo> listTeachBuildInfo() {
        return teachBuildInfoMapper.listTeachBuildInfo();
    }

    @Override
    public void delete(Integer id) {
        teachBuildInfoMapper.delete(id);
    }

    @Override
    public Integer deleteSelection(List<Integer> idList) {
        return teachBuildInfoMapper.deleteSelection(idList);
    }

    @Override
    public String insert(TeachBuildInfo teachBuildInfo) {
        int result = teachBuildInfoMapper.countByTeachBuildInfo(teachBuildInfo);
        if (result > 0) {
            return "exit";
        }
        teachBuildInfoMapper.insert(teachBuildInfo);
        return null;
    }

    @Override
    public String update(TeachBuildInfo teachBuildInfo) {
        int result = teachBuildInfoMapper.countByTeachBuildInfo(teachBuildInfo);
        if (result > 0) {
            return "exit";
        }
        teachBuildInfoMapper.update(teachBuildInfo);
        return null;
    }

    @Override
    public TeachBuildInfo selectById(Integer id) {
        return teachBuildInfoMapper.selectById(id);
    }

    @Override
    public PageInfo<TeachBuildInfo> listByTeachBuildInfo(TeachBuildInfo teachBuildInfo, Integer pageNum, Integer pageSize) {
        // 设置分页参数
        PageHelper.startPage(pageNum, pageSize);
        // 查询集合
        List<TeachBuildInfo> teachBuildInfoList = teachBuildInfoMapper.listByTeachBuildInfo(teachBuildInfo);
        PageInfo<TeachBuildInfo> pageInfo = new PageInfo<>(teachBuildInfoList);
        return pageInfo;
    }
}
