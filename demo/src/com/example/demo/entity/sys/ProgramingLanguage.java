package com.example.demo.entity.sys;

import java.util.Date;

/**
 * 编程语言科目实体类
 * 
 * @author admin
 *
 */
public class ProgramingLanguage {
	/**
	 * 编程语言id
	 */
	private Integer langId;
	/**
	 * 编程语言名称
	 */
	private String langName;
	/**
	 * 编程语言描述
	 */
	private String langDesc;
	/**
	 * 编程语言图标
	 */
	private String langImgSrc;
	/**
	 * 编程语言创建时间
	 */
	private Date langCreateTime;
	/**
	 * 编程语言被创建者
	 */
	private String langCreatedBy;
	/**
	 * 编程语言最近修改时间
	 */
	private Date langChangeTime;
	/**
	 * 编程语言最近被修改者
	 */
	private String langLastChanger;
	/**
	 * 是否在学生首页显示推荐，默认为0不推荐，1为推荐
	 */
	private String isRecommend;

	public Integer getLangId() {
		return langId;
	}

	public void setLangId(Integer langId) {
		this.langId = langId;
	}

	public String getLangName() {
		return langName;
	}

	public void setLangName(String langName) {
		this.langName = langName == null ? null : langName.trim();
	}

	public String getLangDesc() {
		return langDesc;
	}

	public void setLangDesc(String langDesc) {
		this.langDesc = langDesc == null ? null : langDesc.trim();
	}

	public String getLangImgSrc() {
		return langImgSrc;
	}

	public void setLangImgSrc(String langImgSrc) {
		this.langImgSrc = langImgSrc == null ? null : langImgSrc.trim();
	}

	public Date getLangCreateTime() {
		return langCreateTime;
	}

	public void setLangCreateTime(Date langCreateTime) {
		this.langCreateTime = langCreateTime;
	}

	public String getLangCreatedBy() {
		return langCreatedBy;
	}

	public void setLangCreatedBy(String langCreatedBy) {
		this.langCreatedBy = langCreatedBy == null ? null : langCreatedBy.trim();
	}

	public Date getLangChangeTime() {
		return langChangeTime;
	}

	public void setLangChangeTime(Date langChangeTime) {
		this.langChangeTime = langChangeTime;
	}

	public String getLangLastChanger() {
		return langLastChanger;
	}

	public void setLangLastChanger(String langLastChanger) {
		this.langLastChanger = langLastChanger == null ? null : langLastChanger.trim();
	}

	public String getIsRecommend() {
		return isRecommend;
	}

	public void setIsRecommend(String isRecommend) {
		this.isRecommend = isRecommend == null ? null : isRecommend.trim();
	}
}