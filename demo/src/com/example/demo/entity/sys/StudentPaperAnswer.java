package com.example.demo.entity.sys;

/**
 * 学生答卷答案实体类
 * 
 * @author admin
 *
 */
public class StudentPaperAnswer {
	/**
	 * 学生答卷答案id
	 */
	private Integer answerId;
	/**
	 * 学生答卷答案
	 */
	private String stuAnswer;
	/**
	 * 答案是否正确
	 */
	private String iscorrect;
	/**
	 * 问题id
	 */
	private Integer queId;
	/**
	 * 试卷id
	 */
	private Integer paperId;
	/**
	 * 学号
	 */
	private String sno;
	/**
	 * 是否被收藏,0为否，1为是
	 */
	private String iscollect;

	public Integer getAnswerId() {
		return answerId;
	}

	public void setAnswerId(Integer answerId) {
		this.answerId = answerId;
	}

	public String getStuAnswer() {
		return stuAnswer;
	}

	public void setStuAnswer(String stuAnswer) {
		this.stuAnswer = stuAnswer == null ? null : stuAnswer.trim();
	}

	public String getIscorrect() {
		return iscorrect;
	}

	public void setIscorrect(String iscorrect) {
		this.iscorrect = iscorrect == null ? null : iscorrect.trim();
	}

	public Integer getQueId() {
		return queId;
	}

	public void setQueId(Integer queId) {
		this.queId = queId;
	}

	public Integer getPaperId() {
		return paperId;
	}

	public void setPaperId(Integer paperId) {
		this.paperId = paperId;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno == null ? null : sno.trim();
	}

	public String getIscollect() {
		return iscollect;
	}

	public void setIscollect(String iscollect) {
		this.iscollect = iscollect == null ? null : iscollect.trim();
	}
}