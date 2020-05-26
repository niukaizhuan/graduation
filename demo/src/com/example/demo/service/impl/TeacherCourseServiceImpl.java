package com.example.demo.service.impl;

import com.example.demo.entity.TeacherCourse;
import com.example.demo.mapper.TeacherCourseMapper;
import com.example.demo.service.TeacherCourseService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherCourseServiceImpl implements TeacherCourseService {
    @Autowired
    private TeacherCourseMapper teacherCourseMapper;

    @Override
    public List<TeacherCourse> listTeacherCourse() {
        return teacherCourseMapper.listTeacherCourse();
    }

    @Override
    public void delete(Integer id) {
        teacherCourseMapper.delete(id);
    }

    @Override
    public Integer deleteSelection(List<Integer> idList) {
        return teacherCourseMapper.deleteSelection(idList);
    }

    @Override
    public void insert(TeacherCourse teacherCourse) {
        teacherCourseMapper.insert(teacherCourse);
    }

    @Override
    public void update(TeacherCourse teacherCourse) {
        teacherCourseMapper.update(teacherCourse);
    }

    @Override
    public TeacherCourse selectById(Integer id) {
        return teacherCourseMapper.selectById(id);
    }

    @Override
    public PageInfo<TeacherCourse> listByTeacherCourse(TeacherCourse teacherCourse, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<TeacherCourse> teacherCourseList = teacherCourseMapper.listByTeacherCourse(teacherCourse);
        PageInfo<TeacherCourse> pageInfo = new PageInfo<>(teacherCourseList);
        return pageInfo;
    }
}
