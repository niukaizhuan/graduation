package com.example.demo.entity.sys;

import java.util.Date;

/**
 * 反馈信息实体类
 * 
 * @author admin
 *
 */
public class StudentFeedback {
	/**
	 * 反馈id
	 */
	private Integer feedbackId;
	/**
	 * 反馈内容
	 */
	private String feedbackContent;
	/**
	 * 反馈创建时间
	 */
	private Date feedbackCreateTime;
	/**
	 * 学号
	 */
	private String sno;
	/**
	 * 学生姓名
	 */
	private String stuName;
	/**
	 * 管理员回复
	 */
	private String admAnswer;
	/**
	 * 管理员号
	 */
	private String ano;
	/**
	 * 管理员姓名
	 */
	private String admName;
	/**
	 * 留言状态0为管理员未读，1为管理员已读学生未读，2为学生已读
	 */
	private String feedbackStatus;
	/**
	 * 管理员回复时间
	 */
	private Date replyTime;

	public Integer getFeedbackId() {
		return feedbackId;
	}

	public void setFeedbackId(Integer feedbackId) {
		this.feedbackId = feedbackId;
	}

	public String getFeedbackContent() {
		return feedbackContent;
	}

	public void setFeedbackContent(String feedbackContent) {
		this.feedbackContent = feedbackContent == null ? null : feedbackContent.trim();
	}

	public Date getFeedbackCreateTime() {
		return feedbackCreateTime;
	}

	public void setFeedbackCreateTime(Date feedbackCreateTime) {
		this.feedbackCreateTime = feedbackCreateTime;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno == null ? null : sno.trim();
	}

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName == null ? null : stuName.trim();
	}

	public String getAdmAnswer() {
		return admAnswer;
	}

	public void setAdmAnswer(String admAnswer) {
		this.admAnswer = admAnswer == null ? null : admAnswer.trim();
	}

	public String getAno() {
		return ano;
	}

	public void setAno(String ano) {
		this.ano = ano == null ? null : ano.trim();
	}

	public String getAdmName() {
		return admName;
	}

	public void setAdmName(String admName) {
		this.admName = admName == null ? null : admName.trim();
	}

	public String getFeedbackStatus() {
		return feedbackStatus;
	}

	public void setFeedbackStatus(String feedbackStatus) {
		this.feedbackStatus = feedbackStatus == null ? null : feedbackStatus.trim();
	}

	public Date getReplyTime() {
		return replyTime;
	}

	public void setReplyTime(Date replyTime) {
		this.replyTime = replyTime;
	}
}