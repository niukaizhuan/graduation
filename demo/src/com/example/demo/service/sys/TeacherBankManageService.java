package com.example.demo.service.sys;

import java.util.List;
import java.util.Map;

public interface TeacherBankManageService {
	/**
	 * 获取全部单选题信息
	 * 
	 * @return
	 */
	public List<Map<String, Object>> getSingleList();

	/**
	 * 获取搜索单选题信息
	 * 
	 * @param content
	 * @param langId
	 * @param composeFlag
	 * @return
	 */
	public List<Map<String, Object>> searchSingleList(String content, Integer langId, String composeFlag);

	/**
	 * 删除单选题
	 * 
	 * @param singleId
	 * @return
	 */
	public int deleteSingle(Integer singleId);

	/**
	 * 添加单选题题目
	 * 
	 * @param obj
	 * @return
	 */
	public int insertSingleInfo(Map<String, Object> obj);

	/**
	 * 更新单选题题目
	 * 
	 * @param obj
	 * @return
	 */
	public int updateSingleInfo(Map<String, Object> obj);

	/**
	 * 添加导入单选题Excel文件
	 * 
	 * @param singleList
	 * @return
	 */
	public int insertSingleList(List<Map<String, Object>> singleList);

	/**
	 * 获取全部多选题信息
	 * 
	 * @return
	 */
	public List<Map<String, Object>> getMultipleList();

	/**
	 * 获取搜索多选题信息
	 * 
	 * @param content
	 * @param langId
	 * @param composeFlag
	 * @return
	 */
	public List<Map<String, Object>> searchMultipleList(String content, Integer langId, String composeFlag);

	/**
	 * 删除多选题
	 * 
	 * @param multipleId
	 * @return
	 */
	public int deleteMultiple(Integer multipleId);

	/**
	 * 添加多选题题目
	 * 
	 * @param obj
	 * @return
	 */
	public int insertMultipleInfo(Map<String, Object> obj);

	/**
	 * 更新多选题题目
	 * 
	 * @param obj
	 * @return
	 */
	public int updateMultipleInfo(Map<String, Object> obj);

	/**
	 * 添加导入多选题Excel文件
	 * 
	 * @param multipleList
	 * @return
	 */
	public int insertMultipleList(List<Map<String, Object>> multipleList);

	/**
	 * 获取全部判断题信息
	 * 
	 * @return
	 */
	public List<Map<String, Object>> getJudgeList();

	/**
	 * 获取搜索判断题信息
	 * 
	 * @param content
	 * @param langId
	 * @param composeFlag
	 * @return
	 */
	public List<Map<String, Object>> searchJudgeList(String content, Integer langId, String composeFlag);

	/**
	 * 删除判断题
	 * 
	 * @param judgeId
	 * @return
	 */
	public int deleteJudge(Integer judgeId);

	/**
	 * 添加判断题题目
	 * 
	 * @param obj
	 * @return
	 */
	public int insertJudgeInfo(Map<String, Object> obj);

	/**
	 * 更新判断题题目
	 * 
	 * @param obj
	 * @return
	 */
	public int updateJudgeInfo(Map<String, Object> obj);

	/**
	 * 添加导入判断题Excel文件
	 * 
	 * @param judgeList
	 * @return
	 */
	public int insertJudgeList(List<Map<String, Object>> judgeList);

	/**
	 * 获取全部填空题信息
	 * 
	 * @return
	 */
	public List<Map<String, Object>> getFillList();

	/**
	 * 获取搜索填空题信息
	 * 
	 * @param content
	 * @param langId
	 * @param composeFlag
	 * @return
	 */
	public List<Map<String, Object>> searchFillList(String content, Integer langId, String composeFlag);

	/**
	 * 删除填空题
	 * 
	 * @param fillId
	 * @return
	 */
	public int deleteFill(Integer fillId);

	/**
	 * 添加填空题题目
	 * 
	 * @param obj
	 * @return
	 */
	public int insertFillInfo(Map<String, Object> obj);

	/**
	 * 更新填空题题目
	 * 
	 * @param obj
	 * @return
	 */
	public int updateFillInfo(Map<String, Object> obj);

	/**
	 * 添加导入填空题Excel文件
	 * 
	 * @param fillList
	 * @return
	 */
	public int inserFillList(List<Map<String, Object>> fillList);
}
