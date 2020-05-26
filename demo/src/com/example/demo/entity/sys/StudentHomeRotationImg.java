package com.example.demo.entity.sys;

import java.util.Date;

/**
 * 轮播图实体类
 * 
 * @author admin
 *
 */
public class StudentHomeRotationImg {
	/**
	 * 轮播图id
	 */
	private Integer imgId;
	/**
	 * 轮播图标题
	 */
	private String imgTitle;
	/**
	 * 轮播图图片地址
	 */
	private String imgSrc;
	/**
	 * 轮播图创建时间
	 */
	private Date imgCreateTime;
	/**
	 * 创建轮播图的管理员id
	 */
	private Integer ano;
	/**
	 * 创建轮播图的管理员姓名
	 */
	private String admName;

	public Integer getImgId() {
		return imgId;
	}

	public void setImgId(Integer imgId) {
		this.imgId = imgId;
	}

	public String getImgTitle() {
		return imgTitle;
	}

	public void setImgTitle(String imgTitle) {
		this.imgTitle = imgTitle == null ? null : imgTitle.trim();
	}

	public String getImgSrc() {
		return imgSrc;
	}

	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc == null ? null : imgSrc.trim();
	}

	public Date getImgCreateTime() {
		return imgCreateTime;
	}

	public void setImgCreateTime(Date imgCreateTime) {
		this.imgCreateTime = imgCreateTime;
	}

	public Integer getAno() {
		return ano;
	}

	public void setAno(Integer ano) {
		this.ano = ano;
	}

	public String getAdmName() {
		return admName;
	}

	public void setAdmName(String admName) {
		this.admName = admName == null ? null : admName.trim();
	}
}