package com.example.demo.entity.sys;

import java.util.Date;

/**
 * 管理员实体类
 * 
 * @author admin
 *
 */
public class Admin {
	/**
	 * 管理员号
	 */
	private String ano;
	/**
	 * 登录密码
	 */
	private String admPsw;
	/**
	 * 管理员姓名
	 */
	private String admName;
	/**
	 * 管理员性别
	 */
	private String admSex;
	/**
	 * 管理员邮箱
	 */
	private String admEmail;
	/**
	 * 管理员手机号码
	 */
	private String admPhone;
	/**
	 * 管理员最近登录时间
	 */
	private Date admLastLoginTime;

	public String getAno() {
		return ano;
	}

	public void setAno(String ano) {
		this.ano = ano == null ? null : ano.trim();
	}

	public String getAdmPsw() {
		return admPsw;
	}

	public void setAdmPsw(String admPsw) {
		this.admPsw = admPsw == null ? null : admPsw.trim();
	}

	public String getAdmName() {
		return admName;
	}

	public void setAdmName(String admName) {
		this.admName = admName == null ? null : admName.trim();
	}

	public String getAdmSex() {
		return admSex;
	}

	public void setAdmSex(String admSex) {
		this.admSex = admSex == null ? null : admSex.trim();
	}

	public String getAdmEmail() {
		return admEmail;
	}

	public void setAdmEmail(String admEmail) {
		this.admEmail = admEmail == null ? null : admEmail.trim();
	}

	public String getAdmPhone() {
		return admPhone;
	}

	public void setAdmPhone(String admPhone) {
		this.admPhone = admPhone == null ? null : admPhone.trim();
	}

	public Date getAdmLastLoginTime() {
		return admLastLoginTime;
	}

	public void setAdmLastLoginTime(Date admLastLoginTime) {
		this.admLastLoginTime = admLastLoginTime;
	}
}