package com.example.demo.entity.sys;

/**
 * 问题实体类
 * 
 * @author admin
 *
 */
public class PaperQue {
	/**
	 * 问题id
	 */
	private Integer queId;
	/**
	 * 题类型
	 */
	private Integer queType;
	/**
	 * 单选题id
	 */
	private Integer singleId;
	/**
	 * 多选题id
	 */
	private Integer multipleId;
	/**
	 * 判断题id
	 */
	private Integer judgeId;
	/**
	 * 填空题id
	 */
	private Integer fillId;
	/**
	 * 试卷id
	 */
	private Integer paperId;

	public Integer getQueId() {
		return queId;
	}

	public void setQueId(Integer queId) {
		this.queId = queId;
	}

	public Integer getQueType() {
		return queType;
	}

	public void setQueType(Integer queType) {
		this.queType = queType;
	}

	public Integer getSingleId() {
		return singleId;
	}

	public void setSingleId(Integer singleId) {
		this.singleId = singleId;
	}

	public Integer getMultipleId() {
		return multipleId;
	}

	public void setMultipleId(Integer multipleId) {
		this.multipleId = multipleId;
	}

	public Integer getJudgeId() {
		return judgeId;
	}

	public void setJudgeId(Integer judgeId) {
		this.judgeId = judgeId;
	}

	public Integer getFillId() {
		return fillId;
	}

	public void setFillId(Integer fillId) {
		this.fillId = fillId;
	}

	public Integer getPaperId() {
		return paperId;
	}

	public void setPaperId(Integer paperId) {
		this.paperId = paperId;
	}
}