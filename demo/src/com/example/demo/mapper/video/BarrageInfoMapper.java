package com.example.demo.mapper.video;

import com.example.demo.entity.video.BarrageInfo;

import java.util.List;

public interface BarrageInfoMapper {
    /**
     * 插入
     *
     * @param record
     * @return
     */
    void insert(BarrageInfo record);

    /**
     * 根据弹幕信息标识查询学期信息
     *
     * @param id 标识
     * @return
     */
    BarrageInfo selectById(Integer id);

    /**
     * 通过id逻辑删除
     *
     * @param id
     * @return
     */
    void delete(Integer id);

    /**
     * 更新弹幕信息
     *
     * @param barrageInfo
     * @return
     */
    void update(BarrageInfo barrageInfo);

    /**
     * 过滤查询弹幕信息
     *
     * @param barrageInfo 弹幕类
     * @return 弹幕信息集合
     */
    List<BarrageInfo> listByBarrageInfo(BarrageInfo barrageInfo);

//    List<BarrageInfo> selectByExample(BarrageExample barrageExample);
}