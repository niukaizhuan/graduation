package com.example.demo.service;

import com.example.demo.entity.video.BarrageInfo;
import com.github.pagehelper.PageInfo;

public interface BarrageInfoService {
    void insert (BarrageInfo barrage,String token);

    PageInfo<BarrageInfo> listByBarrageInfo(BarrageInfo barrageInfo, Integer pageNum, Integer pageSize);

//    List<BarrageInfo> showBarrages(Integer videoId);

}
