package com.example.demo.mapper.video;

import com.example.demo.entity.video.CommentInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MyCommentMapper {
	CommentInfo findById(@Param("id") Integer id);
	
	List<CommentInfo> showComments(@Param("id") int videoId);
}
