package com.example.demo.service.sys;

import com.example.demo.entity.sys.Paper;
import com.example.demo.entity.sys.ProgramingLanguage;
import com.example.demo.entity.sys.StudentHomeRotationImg;
import com.example.demo.entity.sys.StudentPaperScore;

import java.util.List;
import java.util.Map;

public interface StudentHomeService {

	/**
	 * 获取学生首页轮播图数据
	 * 
	 * @return
	 */
	public List<StudentHomeRotationImg> getRotationImages();

	/**
	 * 获取学生首页全部全部编程语言信息
	 * 
	 * @return
	 */
	public List<ProgramingLanguage> getLanguagesInfo();

	/**
	 * 通过langId获取编程语言信息
	 * 
	 * @param langId
	 * @return
	 */
	public ProgramingLanguage getLanguageInfoById(Integer langId);

	/**
	 * 通过langId获取试卷信息
	 * 
	 * @param langId
	 * @return
	 */
	public List<Paper> getPapersInfo(Integer langId);

	/**
	 * 通过paperId获取试卷及单选题、多选题、判断题和填空题信息
	 * 
	 * @param paperId
	 * @return
	 */
	public Paper getPapersInfoByPaperId(Integer paperId);

	/**
	 * 通过paperId获取试卷问题信息
	 * @param paperId
	 * @return
	 */
	public Map<String, Integer> getPaperQueNumByPaperId(Integer paperId);

	/**
	 * 插入学生成绩表成绩信息，包含三个字段，考试开始时间、学号和试卷id
	 * 
	 * @param studentPaperScore
	 * @return
	 */
	public int insertStudentPaperScore(StudentPaperScore studentPaperScore);

	public List<Map<String, Object>> getSingleQueListByPaperId(Integer paperId);

	public List<Map<String, Object>> getMultipleQueListByPaperId(Integer paperId);

	public List<Map<String, Object>> getJudgeQueListByPaperId(Integer paperId);

	public List<Map<String, Object>> getFillQueListByPaperId(Integer paperId);

	/**
	 * 插入学生成绩表成绩信息和学生试卷答题记录信息
	 * 
	 * @param sno
	 * @param paperId
	 * @param singleAnswers
	 * @param multipleAnswers
	 * @param judgeAnswers
	 * @param fillAnswers
	 * @param timeUsed
	 * @return
	 */
	public int insertPaperAnswerAndPaperScore(String sno, Integer paperId, List<String> singleAnswers,
			List<List<String>> multipleAnswers, List<String> judgeAnswers, List<String> fillAnswers, int timeUsed);

	/**
	 * 请求获取当前试卷状态，即是否已完成
	 * 
	 * @param sno
	 * @param paperId
	 * @return
	 */
	public List<StudentPaperScore> getCurrentPaperStatus(String sno, Integer paperId);

	/**
	 * 请求获取当前试卷的成绩报告
	 * 
	 * @param sno
	 * @param paperId
	 * @return
	 */
	public Map<String, Object> getScoreReport(String sno, Integer paperId);
}
