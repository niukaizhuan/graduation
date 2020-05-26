package com.example.demo.entity.sys;

/**
 * 多选题实体类
 * 
 * @author admin
 *
 */
public class BankMultipleChoiceQue {
	/**
	 * 多选题id
	 */
	private Integer multipleId;

	/**
	 * 多选题内容
	 */
	private String multipleContent;
	/**
	 * 选项A
	 */
	private String choiceA;
	/**
	 * 选项B
	 */
	private String choiceB;
	/**
	 * 选项C
	 */
	private String choiceC;
	/**
	 * 选项D
	 */
	private String choiceD;
	/**
	 * 选项E
	 */
	private String choiceE;
	/**
	 * 选项F
	 */
	private String choiceF;
	/**
	 * 选项G
	 */
	private String choiceG;
	/**
	 * 多选题答案
	 */
	private String multipleAnswer;
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

	public Integer getMultipleId() {
		return multipleId;
	}

	public void setMultipleId(Integer multipleId) {
		this.multipleId = multipleId;
	}

	public String getMultipleContent() {
		return multipleContent;
	}

	public void setMultipleContent(String multipleContent) {
		this.multipleContent = multipleContent == null ? null : multipleContent.trim();
	}

	public String getChoiceA() {
		return choiceA;
	}

	public void setChoiceA(String choiceA) {
		this.choiceA = choiceA == null ? null : choiceA.trim();
	}

	public String getChoiceB() {
		return choiceB;
	}

	public void setChoiceB(String choiceB) {
		this.choiceB = choiceB == null ? null : choiceB.trim();
	}

	public String getChoiceC() {
		return choiceC;
	}

	public void setChoiceC(String choiceC) {
		this.choiceC = choiceC == null ? null : choiceC.trim();
	}

	public String getChoiceD() {
		return choiceD;
	}

	public void setChoiceD(String choiceD) {
		this.choiceD = choiceD == null ? null : choiceD.trim();
	}

	public String getChoiceE() {
		return choiceE;
	}

	public void setChoiceE(String choiceE) {
		this.choiceE = choiceE == null ? null : choiceE.trim();
	}

	public String getChoiceF() {
		return choiceF;
	}

	public void setChoiceF(String choiceF) {
		this.choiceF = choiceF == null ? null : choiceF.trim();
	}

	public String getChoiceG() {
		return choiceG;
	}

	public void setChoiceG(String choiceG) {
		this.choiceG = choiceG == null ? null : choiceG.trim();
	}

	public String getMultipleAnswer() {
		return multipleAnswer;
	}

	public void setMultipleAnswer(String multipleAnswer) {
		this.multipleAnswer = multipleAnswer == null ? null : multipleAnswer.trim();
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