package com.example.demo.service.sys;

import com.example.demo.entity.sys.Student;

import java.util.List;
import java.util.Map;

public interface TeacherStudentService {
	/**
	 * 获取学生列表信息
	 * 
	 * @return
	 */
	public List<Student> getStudentsList();

	/**
	 * 更新学生信息
	 * 
	 * @param student
	 * @return
	 */
	public int updateStudentInfo(Student student);

	/**
	 * 获取搜索学生列表信息
	 * 
	 * @param sno
	 * @param stuName
	 * @param stuSex
	 * @return
	 */
	public List<Student> searchStudentInfo(String sno, String stuName, String stuSex);

	/**
	 * 添加学生信息
	 * 
	 * @param student
	 * @return
	 */
	public int insertStudentInfo(Student student);

	/**
	 * 获取成绩列表信息
	 * 
	 * @return
	 */
	public List<Map<String, Object>> getScoresList();

	/**
	 * 获取全部已发布试卷信息
	 * 
	 * @return
	 */
	public List<Map<String, Object>> getPapersList();

	/**
	 * 删除学生成绩
	 * 
	 * @param sno
	 * @param paperId
	 * @return
	 */
	public int deleteScore(String sno, Integer paperId);

	/**
	 * 获取搜索成绩列表信息
	 * 
	 * @param sno
	 * @param paperId
	 * @return
	 */
	public List<Map<String, Object>> searchScoresList(String sno, Integer paperId);

	/**
	 * 获取成绩图标数据
	 * 
	 * @param paperId
	 * @return
	 */
	public Map<String, Object> getChartData(Integer paperId);

	/**
	 * 添加导入学生信息Excel文件
	 * 
	 * @param studentList
	 * @return
	 */
	public Map<String, Object> insertStudentInfoList(List<Map<String, Object>> studentList);
}
