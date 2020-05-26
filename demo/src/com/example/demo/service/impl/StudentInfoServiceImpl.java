package com.example.demo.service.impl;

import com.example.demo.entity.StudentInfo;
import com.example.demo.mapper.StudentInfoMapper;
import com.example.demo.service.StudentInfoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentInfoServiceImpl implements StudentInfoService {
	
	@Autowired
	private StudentInfoMapper studentInfoMapper;

	@Override
	public List<StudentInfo> selectStudentInfoList() {
		return studentInfoMapper.selectStudentInfoList();
	}

	@Override
	public String insert(StudentInfo studentInfo) {
		int count = studentInfoMapper.countByStudentInfo(studentInfo);
		if(count>0){
			return "exist";
		}
		studentInfoMapper.insert(studentInfo);
		return null;

	}

	@Override
	public void update(StudentInfo studentInfo) {
		studentInfoMapper.update(studentInfo);

	}

	@Override
	public void delete(Integer id) {
		studentInfoMapper.delete(id);

	}

	@Override
	public Integer deleteSelection(List<Integer> idList) {
		return studentInfoMapper.deleteSelection(idList);
	}

	@Override
	public StudentInfo selectById(Integer id) {
		return studentInfoMapper.selectById(id);
	}

	@Override
	public PageInfo<StudentInfo> selectPageInfo(StudentInfo studentInfo, Integer pageNum, Integer pageSize) {
		// 设置分页参数
		PageHelper.startPage(pageNum, pageSize);
		// 查询集合
		List<StudentInfo> studentInfoList = studentInfoMapper.listByStudentInfo(studentInfo);
		PageInfo<StudentInfo> pageInfo = new PageInfo<StudentInfo>(studentInfoList);
		return pageInfo;
	}

	@Override
	public PageInfo<StudentInfo> selectStudentManage(Integer courseClassInfoId) {
/*		// 设置分页参数
		PageHelper.startPage(pageNum, pageSize);*/
		// 查询集合
		List<StudentInfo> studentInfoList = studentInfoMapper.selectStudentManage(courseClassInfoId);
		PageInfo<StudentInfo> pageInfo = new PageInfo<StudentInfo>(studentInfoList);
		return pageInfo;
	}

	@Override
	public PageInfo<StudentInfo> listByMessage(StudentInfo studentInfo) {
		List<StudentInfo> studentInfoList = studentInfoMapper.listByMessage(studentInfo);
		PageInfo<StudentInfo> pageInfo = new PageInfo<StudentInfo>(studentInfoList);
		return pageInfo;
	}

	@Override
	public List<StudentInfo> studentList(String studentName) {
		return studentInfoMapper.studentList(studentName);
	}

}
