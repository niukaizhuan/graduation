package com.example.demo.service.sys;

import com.example.demo.entity.sys.StudentFeedback;

import java.util.List;
import java.util.Map;

public interface AdminFeedbackService {
	/**
	 * 获取全部留言信息
	 * 
	 * @return
	 */
	public List<Map<String, Object>> getFeedbacksList();

	/**
	 * 获取未回复留言条数
	 * 
	 * @return
	 */
	public int getUnReplyCount();

	/**
	 * 获取全部留言信息
	 * 
	 * @param feedbackContent
	 * @param stuName
	 * @param admAnswer
	 * @param admName
	 * @param feedbackStatus
	 * @return
	 */
	public List<Map<String, Object>> searchFeedbacksList(String feedbackContent, String stuName, String admAnswer,
			String admName, String feedbackStatus);

	/**
	 * 删除留言
	 * 
	 * @param feedbackId
	 * @return
	 */
	public int deleteFeedback(Integer feedbackId);

	/**
	 * 回复留言
	 * 
	 * @param studentFeedback
	 * @return
	 */
	public int replyFeedback(StudentFeedback studentFeedback);
}
