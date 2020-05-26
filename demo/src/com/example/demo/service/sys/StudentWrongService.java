package com.example.demo.service.sys;

import com.example.demo.entity.sys.StudentPaperAnswer;

import java.util.List;
import java.util.Map;

public interface StudentWrongService {

	/**
	 * 获取错题页面全部错题试卷
	 * 
	 * @param sno
	 * @return
	 */
	public List<Map<String, Object>> getWrongAllPapers(String sno);

	/**
	 * 获取错题页面全部错题试卷
	 * 
	 * @param sno
	 * @param langId
	 * @return
	 */
	public List<Map<String, Object>> getWrongPapersByLangId(String sno, Integer langId);

	/**
	 * 获取试卷单选题列表信息
	 * 
	 * @param sno
	 * @param paperId
	 * @return
	 */
	public List<Map<String, Object>> getSingleQueListByWrongPaperId(String sno, Integer paperId);

	/**
	 * 获取试卷多选题列表信息
	 * 
	 * @param sno
	 * @param paperId
	 * @return
	 */
	public List<Map<String, Object>> getMultipleQueListByWrongPaperId(String sno, Integer paperId);

	/**
	 * 获取试卷判断题列表信息
	 * 
	 * @param sno
	 * @param paperId
	 * @return
	 */
	public List<Map<String, Object>> getJudgeQueListByWrongPaperId(String sno, Integer paperId);

	/**
	 * 获取试卷填空题列表信息
	 * 
	 * @param sno
	 * @param paperId
	 * @return
	 */
	public List<Map<String, Object>> getFillQueListByWrongPaperId(String sno, Integer paperId);

	/**
	 * 请求根据answerId更新学生试卷答案表isCollect字段
	 * 
	 * @param studentPaperAnswer
	 * @return
	 */
	public int updatePaperAnswerIsCollect(StudentPaperAnswer studentPaperAnswer);

	/**
	 * 获取全部收藏题目
	 * 
	 * @param sno
	 * @return
	 */
	public List<Map<String, Object>> getAllCollections(String sno);

	/**
	 * 通过题目类型id获取收藏题目
	 * 
	 * @param sno
	 * @param queType
	 * @return
	 */
	public List<Map<String, Object>> getCollectionsById(String sno, Integer queType);

	/**
	 * 通过answerId获取收藏单选题信息
	 * 
	 * @param answerId
	 * @return
	 */
	public Map<String, Object> getSingleByAnswerId(Integer answerId);

	/**
	 * 通过answerId获取收藏多选题信息
	 * 
	 * @param answerId
	 * @return
	 */
	public Map<String, Object> getMultipleByAnswerId(Integer answerId);

	/**
	 * 通过answerId获取收藏判断题信息
	 * 
	 * @param answerId
	 * @return
	 */
	public Map<String, Object> getJudgeByAnswerId(Integer answerId);

	/**
	 * 通过answerId获取收藏填空题信息
	 * 
	 * @param answerId
	 * @return
	 */
	public Map<String, Object> getFillByAnswerId(Integer answerId);
}
