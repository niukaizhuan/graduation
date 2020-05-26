package com.example.demo.service.sys;

import com.example.demo.entity.sys.Teacher;

import java.util.List;
import java.util.Map;

public interface AdminTeacherService {

	/**
	 * 添加导入教师信息Excel文件
	 * 
	 * @param teacherList
	 * @return
	 */
	public Map<String, Object> insertTeacherInfoList(List<Map<String, Object>> teacherList);

	/**
	 * 添加教师信息
	 * 
	 * @param tno
	 * @return
	 */
	public boolean tnoIsExist(String tno);

	/**
	 * 获取教师列表信息
	 * 
	 * @return
	 */
	public List<Teacher> getTeachersList();

	/**
	 * 更新教师信息
	 * 
	 * @param teacher
	 * @return
	 */
	public int updateTeacherInfo(Teacher teacher);

	/**
	 * 获取搜索教师列表信息
	 * 
	 * @param tno
	 * @param teaName
	 * @param teaSex
	 * @return
	 */
	public List<Teacher> searchTeacherInfo(String tno, String teaName, String teaSex);

	public int insertTeacherInfo(Teacher teacher);
}
