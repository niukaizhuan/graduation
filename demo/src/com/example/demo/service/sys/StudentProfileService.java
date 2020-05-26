package com.example.demo.service.sys;

import com.example.demo.entity.sys.StudentFeedback;
import com.example.demo.entity.sys.TeacherNotice;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface StudentProfileService {

	/**
	 * 学生发送反馈信息
	 * 
	 * @param content
	 * @param createTime
	 * @param sno
	 * @param stuName
	 * @return
	 */
	public int studentSendFeedback(String content, Date createTime, String sno, String stuName);

	/**
	 * 我的页面顶部右侧管理员回复消息提醒
	 * 
	 * @param sno
	 * @param feedbackStatus
	 * @return
	 */
	public int getAdminReplyCount(String sno, String feedbackStatus);

	/**
	 * 更新反馈信息状态为学生端已读取
	 * 
	 * @param sno
	 * @param feedbackStatus
	 * @return
	 */
	public int updateFeedbackStatusBySno(String sno, String feedbackStatus);

	/**
	 * 获取反馈信息
	 * 
	 * @param sno
	 * @param feedbackStatus
	 * @return
	 */
	public List<StudentFeedback> getFeedbackInfoBySno(String sno, String feedbackStatus);

	/**
	 * 获取考试日历,即教师公告
	 * 
	 * @return
	 */
	public List<TeacherNotice> getTeacherNotice();

	/**
	 * 通过学号sno获取学生试卷成绩信息
	 * 
	 * @param sno
	 * @return
	 */
	public List<Map<String, Object>> getPaperScoreInfoBySno(String sno);
}
