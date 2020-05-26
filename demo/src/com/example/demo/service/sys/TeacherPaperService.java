package com.example.demo.service.sys;

import java.util.List;
import java.util.Map;

public interface TeacherPaperService {
	/**
	 * 获取成绩列表信息
	 * 
	 * @return
	 */
	public List<Map<String, Object>> getPapersList();

	/**
	 * 获取编程语言
	 * 
	 * @return
	 */
	public List<Map<String, Object>> getLangOptions();

	/**
	 * 获取搜索试卷列表信息
	 * 
	 * @param paperName
	 * @param langId
	 * @param paperType
	 * @return
	 */
	public List<Map<String, Object>> searchPapersList(String paperName, Integer langId, Integer paperType);

	/**
	 * 通过试卷id查询成绩
	 * 
	 * @param paperId
	 * @return
	 */
	public int selectPaperScoreByPaperId(Integer paperId);

	/**
	 * 删除选中试卷信息
	 * 
	 * @param paperId
	 * @return
	 */
	public int deletePaper(Integer paperId);

	/**
	 * 获取选中试卷问题详情
	 * 
	 * @param paperId
	 * @param totalNum
	 * @return
	 */
	public Map<String, Object> getPaperQueDetailByPaperId(Integer paperId, Integer totalNum);

	/**
	 * 请求随机组卷，插入试卷数据，即发布试卷
	 * 
	 * @param obj
	 * @return
	 */
	public int randomInsertPaperInfo(Map<String, Object> obj);

	/**
	 * 通过langId获取科目下的所有问题
	 * 
	 * @param langId
	 * @return
	 */
	public Map<String, Object> getPaperQueDetailByLangId(Integer langId);

	/**
	 * 请求固定组卷，插入试卷数据，即发布试卷
	 * 
	 * @param obj
	 * @return
	 */
	public int fixedInsertPaperInfo(Map<String, Object> obj);
}
