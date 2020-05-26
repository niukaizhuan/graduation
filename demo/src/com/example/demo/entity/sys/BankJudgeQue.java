package com.example.demo.entity.sys;

/**
 * 判断题实体类
 * 
 * @author admin
 *
 */
public class BankJudgeQue {
	/**
	 * 判断题id
	 */
	private Integer judgeId;
	/**
	 * 判断题内容
	 */
	private String judgeContent;
	/**
	 * 判断题答案
	 */
	private String judgeAnswer;
	/**
	 * 是否被组成试卷
	 */
	private String composeFlag;
	/**
	 * 题目解析
	 */
	private String answerExplain;
	/**
	 * 该题所属编程语言
	 */
	private Integer langId;
	/**
	 * 问题实体类
	 */
	private PaperQue paperQue;

	public Integer getJudgeId() {
		return judgeId;
	}

	public void setJudgeId(Integer judgeId) {
		this.judgeId = judgeId;
	}

	public String getJudgeContent() {
		return judgeContent;
	}

	public void setJudgeContent(String judgeContent) {
		this.judgeContent = judgeContent == null ? null : judgeContent.trim();
	}

	public String getJudgeAnswer() {
		return judgeAnswer;
	}

	public void setJudgeAnswer(String judgeAnswer) {
		this.judgeAnswer = judgeAnswer == null ? null : judgeAnswer.trim();
	}

	public String getComposeFlag() {
		return composeFlag;
	}

	public void setComposeFlag(String composeFlag) {
		this.composeFlag = composeFlag == null ? null : composeFlag.trim();
	}

	public String getAnswerExplain() {
		return answerExplain;
	}

	public void setAnswerExplain(String answerExplain) {
		this.answerExplain = answerExplain == null ? null : answerExplain.trim();
	}

	public Integer getLangId() {
		return langId;
	}

	public void setLangId(Integer langId) {
		this.langId = langId;
	}

	public PaperQue getPaperQue() {
		return paperQue;
	}

	public void setPaperQue(PaperQue paperQue) {
		this.paperQue = paperQue;
	}
}