package com.example.demo.mapper;

import com.example.demo.entity.video.CommentInfo;

import java.util.List;

public interface CommentInfoMapper {
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
     * @param record
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
    List<CommentInfo> listByCommentInfo(CommentInfo commentInfo);
}