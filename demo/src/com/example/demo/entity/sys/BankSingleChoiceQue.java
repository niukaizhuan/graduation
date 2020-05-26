package com.example.demo.entity.sys;

/**
 * 单选题实体类
 * 
 * @author admin
 *
 */
public class BankSingleChoiceQue {
	/**
	 * 单选题id
	 */
	private Integer singleId;

	/**
	 * 单选题内容
	 */
	private String singleContent;
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
	 * 单选题答案
	 */
	private String singleAnswer;
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

	public Integer getSingleId() {
		return singleId;
	}

	public void setSingleId(Integer singleId) {
		this.singleId = singleId;
	}

	public String getSingleContent() {
		return singleContent;
	}

	public void setSingleContent(String singleContent) {
		this.singleContent = singleContent == null ? null : singleContent.trim();
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

	public String getSingleAnswer() {
		return singleAnswer;
	}

	public void setSingleAnswer(String singleAnswer) {
		this.singleAnswer = singleAnswer == null ? null : singleAnswer.trim();
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