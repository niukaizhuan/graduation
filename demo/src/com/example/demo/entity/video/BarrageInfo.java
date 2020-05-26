package com.example.demo.entity.video;

import lombok.Data;

import java.util.Date;

/**
 * 弹幕表
 */
@Data
public class BarrageInfo {
    /**
     * 弹幕标识
     */
    private Integer id;

    /**
     * 用户标识
     */
    private Integer userId;

    /**
     * 视频标识
     */
    private Integer videoId;
    /**
     * 发送时间
     */
    private Date sendTime;
    /**
     * 内容
     */
    private String content;
    /**
     * 颜色
     */
    private String color;
    /**
     * 播放偏移时间
     */
    private Integer offtime;
    /**
     * 0 固定弹幕 2 浮动弹幕
     */
    private String position;
    /**
     * 状态
     */
    private String state;

}