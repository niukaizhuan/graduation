package com.example.demo.entity.sys;

/**
 * 填空题实体类
 * 
 * @author admin
 *
 */
public class BankFillQue {
	/**
	 * 填空题id
	 */
	private Integer fillId;
	/**
	 * 填空题内容
	 */
	private String fillContent;
	/**
	 * 填空题答案
	 */
	private String fillAnswer;
	/**
	 * 是否被组成
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

	public Integer getFillId() {
		return fillId;
	}

	public void setFillId(Integer fillId) {
		this.fillId = fillId;
	}

	public String getFillContent() {
		return fillContent;
	}

	public void setFillContent(String fillContent) {
		this.fillContent = fillContent == null ? null : fillContent.trim();
	}

	public String getFillAnswer() {
		return fillAnswer;
	}

	public void setFillAnswer(String fillAnswer) {
		this.fillAnswer = fillAnswer == null ? null : fillAnswer.trim();
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