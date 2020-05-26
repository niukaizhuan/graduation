package com.example.demo.mapper;

import com.example.demo.entity.video.VideoInfo;

import java.util.List;

public interface VideoInfoMapper {
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
     *
     * @return
     */
    List<VideoInfo> listByVideoInfo(VideoInfo videoInfo);

    VideoInfo findById(Integer videoId);

    List<VideoInfo> findAllVideos();


//    List<Video> queryVideos(String keyword);
}