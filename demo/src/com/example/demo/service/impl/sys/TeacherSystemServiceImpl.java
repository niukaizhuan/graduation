package com.example.demo.service.impl.sys;

import com.example.demo.entity.sys.Teacher;
import com.example.demo.entity.sys.TeacherExample;
import com.example.demo.mapper.sys.TeacherMapper;
import com.example.demo.service.sys.TeacherSystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherSystemServiceImpl implements TeacherSystemService {

	@Autowired
	TeacherMapper teacherMapper;

	/*
	 * 校验教师登录
	 */
	@Override
	public List<Teacher> teacherLogin(String tno, String psw) {
		TeacherExample teacherExample = new TeacherExample();
		TeacherExample.Criteria criteria = teacherExample.createCriteria();
		criteria.andTnoEqualTo(tno).andTeaPswEqualTo(psw);
		List<Teacher> resultList = teacherMapper.selectByExample(teacherExample);
		return resultList;
	}

	/*
	 * 更新教师信息
	 */
	@Override
	public boolean updateTeacher(Teacher teacher) {
		int result = teacherMapper.updateByPrimaryKeySelective(teacher);
		if (result > 0) {
			return true;
		}
		return false;
	}

	@Override
	public String getTeaHuPsw(String tno) {
		Teacher teacher = teacherMapper.selectByPrimaryKey(tno);
		String teaHuPsw = teacher.getTeaPsw();
		return teaHuPsw;
	}
}
