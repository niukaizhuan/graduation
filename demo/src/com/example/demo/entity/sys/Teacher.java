package com.example.demo.entity.sys;

import java.util.Date;

/**
 * 老师信息控制器
 * 
 * @author admin
 *
 */
public class Teacher {
	/**
	 * 教工号
	 */
	private String tno;
	/**
	 * 登录密码，默认为123456
	 */
	private String teaPsw;
	/**
	 * 教师姓名
	 */
	private String teaName;
	/**
	 * 教师性别
	 */
	private String teaSex;
	/**
	 * 教师邮箱
	 */
	private String teaEmail;
	/**
	 * 教师手机号码
	 */
	private String teaPhone;
	/**
	 * 教师最近登录时间
	 */
	private Date teaLastLoginTime;

	public String getTno() {
		return tno;
	}

	public void setTno(String tno) {
		this.tno = tno == null ? null : tno.trim();
	}

	public String getTeaPsw() {
		return teaPsw;
	}

	public void setTeaPsw(String teaPsw) {
		this.teaPsw = teaPsw == null ? null : teaPsw.trim();
	}

	public String getTeaName() {
		return teaName;
	}

	public void setTeaName(String teaName) {
		this.teaName = teaName == null ? null : teaName.trim();
	}

	public String getTeaSex() {
		return teaSex;
	}

	public void setTeaSex(String teaSex) {
		this.teaSex = teaSex == null ? null : teaSex.trim();
	}

	public String getTeaEmail() {
		return teaEmail;
	}

	public void setTeaEmail(String teaEmail) {
		this.teaEmail = teaEmail == null ? null : teaEmail.trim();
	}

	public String getTeaPhone() {
		return teaPhone;
	}

	public void setTeaPhone(String teaPhone) {
		this.teaPhone = teaPhone == null ? null : teaPhone.trim();
	}

	public Date getTeaLastLoginTime() {
		return teaLastLoginTime;
	}

	public void setTeaLastLoginTime(Date teaLastLoginTime) {
		this.teaLastLoginTime = teaLastLoginTime;
	}
}