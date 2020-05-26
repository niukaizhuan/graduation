package com.example.demo.entity.sys;

import java.util.Date;

/**
 * 教师公告实体类
 * 
 * @author admin
 *
 */
public class TeacherNotice {
	/**
	 * 教师公告id
	 */
	private Integer noticeId;
	/**
	 * 公告内容
	 */
	private String noticeContent;
	/**
	 * 公告创建时间
	 */
	private Date noticeCreateTime;
	/**
	 * 创建公告的教师姓名
	 */
	private String teaName;
	/**
	 * 创建公告教工号
	 */
	private String tno;
	/**
	 * 学号
	 */
	private String sno;
	/**
	 * 是否查看
	 */
	private String isSee;

	public Integer getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(Integer noticeId) {
		this.noticeId = noticeId;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent == null ? null : noticeContent.trim();
	}

	public Date getNoticeCreateTime() {
		return noticeCreateTime;
	}

	public void setNoticeCreateTime(Date noticeCreateTime) {
		this.noticeCreateTime = noticeCreateTime;
	}

	public String getTeaName() {
		return teaName;
	}

	public void setTeaName(String teaName) {
		this.teaName = teaName == null ? null : teaName.trim();
	}

	public String getTno() {
		return tno;
	}

	public void setTno(String tno) {
		this.tno = tno == null ? null : tno.trim();
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno == null ? null : sno.trim();
	}

	public String getIsSee() {
		return isSee;
	}

	public void setIsSee(String isSee) {
		this.isSee = isSee == null ? null : isSee.trim();
	}
}