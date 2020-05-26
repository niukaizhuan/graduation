package com.example.demo.entity.sys;

import java.util.Date;

/**
 * 学生答卷信息实体类
 * 
 * @author admin
 *
 */
public class StudentPaperScore {
	/**
	 * 学生答卷分数id
	 */
	private Integer scoreId;
	/**
	 * 学生答卷总分
	 */
	private Integer score;
	/**
	 * 答题花费时间，单位毫秒
	 */
	private Integer timeUsed;
	/**
	 * 答题开始时间
	 */
	private Date startTime;
	/**
	 * 答题结束时间
	 */
	private Date endTime;
	/**
	 * 学号
	 */
	private String sno;
	/**
	 * 试卷id
	 */
	private Integer paperId;

	public Integer getScoreId() {
		return scoreId;
	}

	public void setScoreId(Integer scoreId) {
		this.scoreId = scoreId;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Integer getTimeUsed() {
		return timeUsed;
	}

	public void setTimeUsed(Integer timeUsed) {
		this.timeUsed = timeUsed;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno == null ? null : sno.trim();
	}

	public Integer getPaperId() {
		return paperId;
	}

	public void setPaperId(Integer paperId) {
		this.paperId = paperId;
	}
}