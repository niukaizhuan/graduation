package com.example.demo.service.sys;

import com.example.demo.entity.sys.Teacher;

import java.util.List;

public interface TeacherSystemService {

	/**
	 * 校验教师登录
	 * 
	 * @param tno
	 * @param psw
	 * @return
	 */
	public List<Teacher> teacherLogin(String tno, String psw);

	/**
	 * 更新教师信息
	 * 
	 * @param teacher
	 * @return
	 */
	public boolean updateTeacher(Teacher teacher);

	/**
	 * 获取老师公告
	 * 
	 * @param tno
	 * @return
	 */
	public String getTeaHuPsw(String tno);
}
