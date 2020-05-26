package com.example.demo.entity.sys;

import java.util.Date;

/**
 * 学生实体类
 * 
 * @author admin
 *
 */
public class Student {
	/**
	 * 主键，学生学号
	 */
	private String sno;
	/**
	 * 登录密码，默认为123456
	 */
	private String stuPsw;
	/**
	 * 学生姓名
	 */
	private String stuName;
	/**
	 * 头像链接
	 */
	private String stuImgSrc;
	/**
	 * 学生性别
	 */
	private String stuSex;
	/**
	 * 学生邮箱
	 */
	private String stuEmail;
	/**
	 * 学生手机号码
	 */
	private String stuPhone;
	/**
	 * 学生注册时间
	 */
	private Date stuCreateTime;
	/**
	 * 学生最近登录时间
	 */
	private Date stuLastLoginTime;
	/**
	 * 学生登录状态
	 */
	private String stuStatus;
	/**
	 * 安全码用于密码找回
	 */
	private String stuSecurityCode;

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno == null ? null : sno.trim();
	}

	public String getStuPsw() {
		return stuPsw;
	}

	public void setStuPsw(String stuPsw) {
		this.stuPsw = stuPsw == null ? null : stuPsw.trim();
	}

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName == null ? null : stuName.trim();
	}

	public String getStuImgSrc() {
		return stuImgSrc;
	}

	public void setStuImgSrc(String stuImgSrc) {
		this.stuImgSrc = stuImgSrc == null ? null : stuImgSrc.trim();
	}

	public String getStuSex() {
		return stuSex;
	}

	public void setStuSex(String stuSex) {
		this.stuSex = stuSex == null ? null : stuSex.trim();
	}

	public String getStuEmail() {
		return stuEmail;
	}

	public void setStuEmail(String stuEmail) {
		this.stuEmail = stuEmail == null ? null : stuEmail.trim();
	}

	public String getStuPhone() {
		return stuPhone;
	}

	public void setStuPhone(String stuPhone) {
		this.stuPhone = stuPhone == null ? null : stuPhone.trim();
	}

	public Date getStuCreateTime() {
		return stuCreateTime;
	}

	public void setStuCreateTime(Date stuCreateTime) {
		this.stuCreateTime = stuCreateTime;
	}

	public Date getStuLastLoginTime() {
		return stuLastLoginTime;
	}

	public void setStuLastLoginTime(Date stuLastLoginTime) {
		this.stuLastLoginTime = stuLastLoginTime;
	}

	public String getStuStatus() {
		return stuStatus;
	}

	public void setStuStatus(String stuStatus) {
		this.stuStatus = stuStatus == null ? null : stuStatus.trim();
	}

	public String getStuSecurityCode() {
		return stuSecurityCode;
	}

	public void setStuSecurityCode(String stuSecurityCode) {
		this.stuSecurityCode = stuSecurityCode == null ? null : stuSecurityCode.trim();
	}
}