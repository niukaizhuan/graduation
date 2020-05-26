package com.example.demo.service;

import com.example.demo.entity.video.VideoInfo;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface VideoInfoService {
    /**
     * 通过id查询视频
     *
     * @param id
     * @return
     */
    VideoInfo selectById(Integer id);

    /**
     * 通过视频地址查询视频
     *
     * @param url
     * @return
     */
    VideoInfo selectByURL(String url);

    /**
     * 查询视频
     *
     * @param record
     */
    void insert(VideoInfo record);

    /**
     * 更新
     *
     * @param videoInfo
     */
    void update(VideoInfo videoInfo);

    /**
     * 查询视频
     * @param videoInfo
     * @param pageNum
     * @param pageSize
     * @return
     */
    PageInfo<VideoInfo> listByVideoInfo(VideoInfo videoInfo, Integer pageNum, Integer pageSize);

    /**
     * 插入视频
     * @param fileInfoId
     */
    void insertByVideo(Integer fileInfoId);

//    VideoInfo findVideoById(Integer videoId);
//
//    List<VideoInfo> showVideos();
//
//    VideoInfo findVideoByUrl(String url);
//
//    void updateVideo(VideoInfo video);
//
//    List<VideoInfo> queryVideos(String keyword);
}
