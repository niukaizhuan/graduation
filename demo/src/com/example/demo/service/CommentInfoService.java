package com.example.demo.service;

import com.example.demo.entity.video.CommentInfo;
import com.github.pagehelper.PageInfo;

import java.util.List;


public interface CommentInfoService {
    /**
     * 通过id查询
     *
     * @param id
     * @return
     */
    CommentInfo selectById(Integer id);

    /**
     * 插入
     *
     * @param commentInfo
     * @return
     */
    void insert(CommentInfo commentInfo);

    /**
     * 更新
     *
     * @param commentInfo
     */
    void update(CommentInfo commentInfo);

    /**
     * 删除
     *
     * @param id
     */
    void delete(Integer id);

    /**
     * 查询
     *
     * @param commentInfo
     * @return
     */
    PageInfo<CommentInfo> listByCommentInfo(CommentInfo commentInfo,Integer pageNum,Integer pageSize);


    CommentInfo findCommentById(Integer id);

    void addComment(CommentInfo comment);

    void deleteComment(Integer id);

    void updateComment(CommentInfo comment);

    List<CommentInfo> showComments(Integer videoId);
}
