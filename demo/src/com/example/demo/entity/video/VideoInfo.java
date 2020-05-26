package com.example.demo.entity.video;

import lombok.Data;
import sun.net.www.content.text.plain;

import java.io.Serializable;
import java.util.Date;

/**
 * 视频信息
 */
@Data
public class VideoInfo implements Serializable {
    /**
     * 视频标识
     */
    private Integer id;
    /**
     * 标题
     */
    private String title;
    /**
     * 视频地址
     */
    private String url;
    /**
     * 上传者标识
     */
    private Integer uploadUserid;
    /**
     * 上传时间
     */
    private Date uploadTime;
    /**
     * 播放量
     */
    private Integer countPlay;
    /**
     * 点赞量
     */
    private Integer countLike;
    /**
     * 封面地址
     */
    private String picUrl;
    /**
     * 描述
     */
    private String description;

    private String state;
    
    private String userName;

    public VideoInfo(Integer id, String title, String url, Integer uploadUserid, Date uploadTime, Integer countPlay, Integer countLike, String picUrl, String description) {
        this.id = id;
        this.title = title;
        this.url = url;
        this.uploadUserid = uploadUserid;
        this.uploadTime = uploadTime;
        this.countPlay = countPlay;
        this.countLike = countLike;
        this.picUrl = picUrl;
        this.description = description;
    }

    public VideoInfo() {
    }
}