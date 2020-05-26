package com.example.demo.entity.video;

import lombok.Data;

import java.time.ZonedDateTime;
import java.util.Date;

/**
 * 评论表
 */
@Data
public class CommentInfo {
    /**
     * 评论标识
     */
    private Integer id;
    /**
     * 视频标识
     */
    private Integer videoId;
    /**
     * 用户标识
     */
    private Integer userId;
    /**
     * 内容
     */
    private String content;
    /**
     * 发送时间
     */
    private Date sendTime;
    /**
     * 点赞量
     */
    private Integer countLike;

    private String state;
    
    private String userName;

    public CommentInfo(Integer id, Integer videoId, Integer userId, String content, Date sendTime, Integer countLike) {
        this.id = id;
        this.videoId = videoId;
        this.userId = userId;
        this.content = content;
        this.sendTime = sendTime;
        this.countLike = countLike;
    }

    public CommentInfo() {
    }
}