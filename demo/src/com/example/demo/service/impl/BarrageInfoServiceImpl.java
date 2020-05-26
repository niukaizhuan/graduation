package com.example.demo.service.impl;

import com.example.demo.entity.video.BarrageInfo;
import com.example.demo.mapper.UserMapper;
import com.example.demo.mapper.video.BarrageInfoMapper;
import com.example.demo.service.BarrageInfoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BarrageInfoServiceImpl implements BarrageInfoService {
    @Autowired
    BarrageInfoMapper barrageInfoMapper;
    @Autowired
    UserMapper userMapper;

    @Override
    public void insert(BarrageInfo barrageInfo,String name) {
    	Integer result = userMapper.selectUserId(name);
    	barrageInfo.setUserId(result);
        barrageInfoMapper.insert(barrageInfo);
    }

    @Override
    public PageInfo<BarrageInfo> listByBarrageInfo(BarrageInfo barrageInfo, Integer pageNum, Integer pageSize) {
        // 设置分页参数
        PageHelper.startPage(pageNum, pageSize);
        // 查询集合
        List<BarrageInfo> barrageInfoList = barrageInfoMapper.listByBarrageInfo(barrageInfo);
        PageInfo<BarrageInfo> pageInfo = new PageInfo<>(barrageInfoList);
        return pageInfo;
    }

//    @Override
//    public List<BarrageInfo> showBarrages(Integer videoId) {
//        BarrageExample barrageExample = new BarrageExample();
//        BarrageExample.Criteria criteria = barrageExample.createCriteria();
//        criteria.andVideoIdEqualTo(videoId);
//        return barrageInfoMapper.selectByExample(barrageExample);
//    }

}
