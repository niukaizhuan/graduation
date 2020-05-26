package com.example.demo.service.impl;

import com.example.demo.config.FileConfig;
import com.example.demo.entity.FileInfo;
import com.example.demo.entity.video.VideoInfo;
import com.example.demo.mapper.FileInfoMapper;
import com.example.demo.mapper.VideoInfoMapper;
import com.example.demo.service.VideoInfoService;
import com.example.demo.util.FfmpegUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@Service
public class VideoInfoServiceImpl implements VideoInfoService {

    @Autowired
    private FileInfoMapper fileInfoMapper;
    @Autowired
    private VideoInfoMapper videoInfoMapper;

    @Override
    public VideoInfo selectById(Integer id) {
        return videoInfoMapper.selectById(id);
    }

    @Override
    public VideoInfo selectByURL(String url) {
        return videoInfoMapper.selectByURL(url);
    }

    @Override
    public void insert(VideoInfo record) {
        videoInfoMapper.insert(record);
    }

    @Override
    public void update(VideoInfo videoInfo) {
        videoInfoMapper.update(videoInfo);
    }

    @Override
    public PageInfo<VideoInfo> listByVideoInfo(VideoInfo videoInfo, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<VideoInfo> videoInfoList = videoInfoMapper.listByVideoInfo(videoInfo);
        System.out.println("视频信息"+videoInfoList.get(0));
        PageInfo<VideoInfo> pageInfo = new PageInfo<>(videoInfoList);
        return pageInfo;
    }

    @Override
    public void insertByVideo(Integer fileInfoId) {
        InputStream is = null;
        // 获取file对象
        FileInfo file = fileInfoMapper.selectById(fileInfoId);
        String fileName = file.getAccessUrl();
        String titleName = file.getFileName();
        fileName = fileName.substring(7);
        System.out.println("----fileName---" + fileName.toString());
        String path = FileConfig.UPLOAD_PATH + File.separator + fileName;
        String picURL = FileConfig.UPLOAD_PATH+"\\"+fileName+".jpg";
        System.out.println(path);
        VideoInfo videoInfo = new VideoInfo();
        List<VideoInfo> videoInfoList = new ArrayList<>();
        try {
            FfmpegUtil.fetchFrame(path,picURL);
            videoInfo.setUrl(path);
            videoInfo.setTitle(titleName);
            videoInfo.setPicUrl(picURL);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("视频格式不对哦！");
        }
    }

//    @Override
//    public VideoInfo findVideoById(Integer videoId) {
//        return videoMapper.findById(videoId);
//    }
//
//    @Override
//    public List<VideoInfo> showVideos() {
//        List<VideoInfo> videoInfoList = videoMapper.findAllVideos();
//        System.out.println(videoInfoList);
//        return videoInfoList;
//    }
//
//    @Override
//    public VideoInfo findVideoByUrl(String url) {
//        return videoMapper.findByUrl(url);
//    }
//
//    @Override
//    public void updateVideo(VideoInfo video) {
//        videoInfoMapper.update(video);
//    }
//
//    @Override
//    public List<VideoInfo> queryVideos(String keyword) {
//        return videoMapper.queryVideo("%" + keyword + "%");
//    }
}
