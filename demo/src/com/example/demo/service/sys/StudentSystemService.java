package com.example.demo.service.sys;

import com.example.demo.entity.sys.Student;

import java.util.Date;
import java.util.List;

public interface StudentSystemService {

	/**
	 * 通过学号获取学生信息
	 * 
	 * @param sno
	 * @return
	 */
	public Student getStudentInfoBySno(String sno);

	/**
	 * 判断学号密码是否匹配
	 * 
	 * @param sno
	 * @param stuPsw
	 * @return
	 */
	public List<Student> checkStudentPsw(String sno, String stuPsw);

	/**
	 * 判断学号存在与否
	 * 
	 * @param sno
	 * @return
	 */
	public boolean snoIsExist(String sno);

	/**
	 * 学生注册
	 * 
	 * @param sno
	 * @param stuPsw
	 * @param stuName
	 * @param stuSex
	 * @param stuEmail
	 * @param stuPhone
	 * @param stuCreateTime
	 * @param stuSecurityCode
	 * @return
	 */
	public int registerStudent(String sno, String stuPsw, String stuName, String stuSex, String stuEmail,
			String stuPhone, Date stuCreateTime, String stuSecurityCode);

	/**
	 * 更新最近登录时间成功
	 * 
	 * @param student
	 * @return
	 */
	public boolean updateStudent(Student student);
}
