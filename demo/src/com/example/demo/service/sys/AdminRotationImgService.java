package com.example.demo.service.sys;

import com.example.demo.entity.sys.StudentHomeRotationImg;

import java.util.List;
import java.util.Map;

public interface AdminRotationImgService {
	/**
	 * 获取全部轮播图信息
	 * 
	 * @return
	 */
	public List<Map<String, Object>> getRotationImgsList();

	/**
	 * 获取搜索轮播图信息
	 * 
	 * @param imgTitle
	 * @param admName
	 * @return
	 */
	public List<Map<String, Object>> searchRotationImgsList(String imgTitle, String admName);

	/**
	 * 添加轮播图信息
	 * 
	 * @param studentHomeRotationImg
	 * @return
	 */
	public int insertRotationImgInfo(StudentHomeRotationImg studentHomeRotationImg);

	/**
	 * 更新轮播图信息
	 * 
	 * @param studentHomeRotationImg
	 * @return
	 */
	public int updateRotationImgInfo(StudentHomeRotationImg studentHomeRotationImg);

	/**
	 * 删除轮播图信息
	 * 
	 * @param imgId
	 * @return
	 */
	public int deleteRotationImgInfo(Integer imgId);
}
