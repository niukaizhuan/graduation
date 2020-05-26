package com.example.demo.service.impl;

import com.example.demo.entity.SchoolTeachBuildInfo;
import com.example.demo.mapper.SchoolTeachBuildInfoMapper;
import com.example.demo.service.SchoolTeachBuildInfoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SchoolTeachBuildInfoServiceImpl implements SchoolTeachBuildInfoService {
    @Autowired
    private SchoolTeachBuildInfoMapper schoolTeachBuildInfoMapper;

    @Override
    public List<SchoolTeachBuildInfo> listSchoolTeachBuildInfo() {
        return schoolTeachBuildInfoMapper.listSchoolTeachBuildInfo();
    }

    @Override
    public void delete(Integer id) {
        schoolTeachBuildInfoMapper.delete(id);
    }

    @Override
    public Integer deleteSelection(List<Integer> idList) {
        return schoolTeachBuildInfoMapper.deleteSelection(idList);
    }

    @Override
    public void insert(SchoolTeachBuildInfo schoolTeachBuildInfo) {
        schoolTeachBuildInfoMapper.insert(schoolTeachBuildInfo);
    }

    @Override
    public void update(SchoolTeachBuildInfo schoolTeachBuildInfo) {
        schoolTeachBuildInfoMapper.update(schoolTeachBuildInfo);
    }

    @Override
    public SchoolTeachBuildInfo selectById(Integer id) {
        return schoolTeachBuildInfoMapper.selectById(id);
    }

    @Override
    public PageInfo<SchoolTeachBuildInfo> listBySchoolTeachBuildInfo(SchoolTeachBuildInfo schoolTeachBuildInfo, Integer pageNum, Integer pageSize) {
        // 设置分页参数
        PageHelper.startPage(pageNum, pageSize);
        // 查询集合
        List<SchoolTeachBuildInfo> schoolTeachBuildInfoList = schoolTeachBuildInfoMapper.listBySchoolTeachBuildInfo(schoolTeachBuildInfo);
        PageInfo<SchoolTeachBuildInfo> pageInfo = new PageInfo<>(schoolTeachBuildInfoList);
        return pageInfo;
    }
}
