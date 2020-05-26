package com.example.demo.entity.sys;

import java.util.Date;

/**
 * 试卷实体类
 * 
 * @author admin
 *
 */
public class Paper {
	/**
	 * 试卷id
	 */
	private Integer paperId;

	/**
	 * 试卷名称
	 */
	private String paperName;
	/**
	 * 试卷创建时间
	 */
	private Date paperCreateTime;
	/**
	 * 考试时长，单位秒
	 */
	private Integer paperDuration;
	/**
	 * 试卷难度
	 */
	private Integer paperDifficulty;
	/**
	 * 考试注意事项
	 */
	private String paperAttention;
	/**
	 * 组卷机制，1为随机，2为固定
	 */
	private Integer paperType;
	/**
	 * 单选题分配分数
	 */
	private Integer singleScore;
	/**
	 * 多选题分配分数
	 */
	private Integer multipleScore;
	/**
	 * 判断题分配分数
	 */
	private Integer judgeScore;
	/**
	 * 填空题分配分数
	 */
	private Integer fillScore;
	/**
	 * 试卷所属编程语言
	 */
	private Integer langId;
	/**
	 * 已参加人数
	 */
	private Integer participateNum;

	public Integer getPaperId() {
		return paperId;
	}

	public void setPaperId(Integer paperId) {
		this.paperId = paperId;
	}

	public String getPaperName() {
		return paperName;
	}

	public void setPaperName(String paperName) {
		this.paperName = paperName == null ? null : paperName.trim();
	}

	public Date getPaperCreateTime() {
		return paperCreateTime;
	}

	public void setPaperCreateTime(Date paperCreateTime) {
		this.paperCreateTime = paperCreateTime;
	}

	public Integer getPaperDuration() {
		return paperDuration;
	}

	public void setPaperDuration(Integer paperDuration) {
		this.paperDuration = paperDuration;
	}

	public Integer getPaperDifficulty() {
		return paperDifficulty;
	}

	public void setPaperDifficulty(Integer paperDifficulty) {
		this.paperDifficulty = paperDifficulty;
	}

	public String getPaperAttention() {
		return paperAttention;
	}

	public void setPaperAttention(String paperAttention) {
		this.paperAttention = paperAttention == null ? null : paperAttention.trim();
	}

	public Integer getPaperType() {
		return paperType;
	}

	public void setPaperType(Integer paperType) {
		this.paperType = paperType;
	}

	public Integer getSingleScore() {
		return singleScore;
	}

	public void setSingleScore(Integer singleScore) {
		this.singleScore = singleScore;
	}

	public Integer getMultipleScore() {
		return multipleScore;
	}

	public void setMultipleScore(Integer multipleScore) {
		this.multipleScore = multipleScore;
	}

	public Integer getJudgeScore() {
		return judgeScore;
	}

	public void setJudgeScore(Integer judgeScore) {
		this.judgeScore = judgeScore;
	}

	public Integer getFillScore() {
		return fillScore;
	}

	public void setFillScore(Integer fillScore) {
		this.fillScore = fillScore;
	}

	public Integer getLangId() {
		return langId;
	}

	public void setLangId(Integer langId) {
		this.langId = langId;
	}

	public Integer getParticipateNum() {
		return participateNum;
	}

	public void setParticipateNum(Integer participateNum) {
		this.participateNum = participateNum;
	}
}