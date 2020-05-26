package com.example.demo.service.impl;

import com.example.demo.entity.video.CommentInfo;
import com.example.demo.mapper.CommentInfoMapper;
import com.example.demo.mapper.video.MyCommentMapper;
import com.example.demo.service.CommentInfoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentInfoServiceImpl implements CommentInfoService {
    @Autowired
    private CommentInfoMapper commentInfoMapper;
    @Autowired
    private MyCommentMapper commentMapper;
    @Override
    public CommentInfo selectById(Integer id) {
        return commentInfoMapper.selectById(id);
    }

    @Override
    public void insert(CommentInfo commentInfo) {
        commentInfoMapper.insert(commentInfo);
    }

    @Override
    public void update(CommentInfo commentInfo) {
        commentInfoMapper.update(commentInfo);
    }

    @Override
    public void delete(Integer id) {
        commentInfoMapper.delete(id);
    }

    @Override
    public PageInfo<CommentInfo> listByCommentInfo(CommentInfo commentInfo, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<CommentInfo> commentInfoList = commentInfoMapper.listByCommentInfo(commentInfo);
        PageInfo<CommentInfo> pageInfo = new PageInfo<>(commentInfoList);
        return pageInfo;
    }

    @Override
    public CommentInfo findCommentById(Integer id) {
        return commentMapper.findById(id);
    }

    @Override
    public void addComment(CommentInfo comment) {
        commentInfoMapper.insert(comment);
    }

    @Override
    public void deleteComment(Integer id) {
        commentInfoMapper.delete(id);
    }

    @Override
    public void updateComment(CommentInfo comment) {
        commentInfoMapper.update(comment);
    }

    @Override
    public List<CommentInfo> showComments(Integer videoId) {
        return commentMapper.showComments(videoId);
    }
}
