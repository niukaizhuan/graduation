package com.example.demo.service.impl;

import com.example.demo.config.FileConfig;
import com.example.demo.entity.FileInfo;
import com.example.demo.entity.GradeInfo;
import com.example.demo.entity.SubjectInfo;
import com.example.demo.mapper.CourseInfoMapper;
import com.example.demo.mapper.FileInfoMapper;
import com.example.demo.mapper.GradeInfoMapper;
import com.example.demo.mapper.SubjectInfoMapper;
import com.example.demo.service.SubjectInfoService;
import com.example.demo.util.PoiUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@Service
public class SubjectInfoServiceImpl implements SubjectInfoService {

    //题库mapper
    @Autowired
    private SubjectInfoMapper subjectInfoMapper;

    //文件mapper
    @Autowired
    private FileInfoMapper fileInfoMapper;

    //年级mapper
    @Autowired
    private GradeInfoMapper gradeInfoMapper;

    //课程
    @Autowired
    private CourseInfoMapper courseInfoMapper;

    @Override
    public List<SubjectInfo> listSubjectInfo() {
        return subjectInfoMapper.listSubjectInfo();
    }

    @Override
    public String insert(SubjectInfo subjectInfo) {
        int result = subjectInfoMapper.countBySubjectInfo(subjectInfo);

        if (result > 0) {
            return "name_exist";
        }
        subjectInfoMapper.insert(subjectInfo);
        return null;
    }

    @Override
    public String update(SubjectInfo subjectInfo) {
        int result = subjectInfoMapper.countBySubjectInfo(subjectInfo);
        if (result > 0) {
            return "name_exist";
        }
        subjectInfoMapper.update(subjectInfo);
        return null;
    }

    @Override
    public void delete(Integer id) {
        subjectInfoMapper.delete(id);

    }

    @Override
    public Integer deleteSelection(List<Integer> idList) {
        return subjectInfoMapper.deleteSelection(idList);
    }

    @Override
    public SubjectInfo selectById(Integer id) {
        return subjectInfoMapper.selectById(id);
    }

    @Override
    public PageInfo<SubjectInfo> listBySubjectInfo(SubjectInfo subjectInfo, Integer pageNum, Integer pageSize) {
        // 设置分页参数
        PageHelper.startPage(pageNum, pageSize);
        // 查询集合
        List<SubjectInfo> subjectInfoList = subjectInfoMapper.listBySubjectInfo(subjectInfo);
        for (SubjectInfo s : subjectInfoList) {
            if (s.getSubjectType().equals("A") || s.getSubjectEasy().equals("A")) {
                s.setTypeSubject("选择题");
                s.setEasySubject("简单");
            }
            if (s.getSubjectType().equals("B") || s.getSubjectEasy().equals("B")) {
                s.setTypeSubject("填空题");
                s.setEasySubject("一般");
            }
            if (s.getSubjectType().equals("C") || s.getSubjectEasy().equals("C")) {
                s.setTypeSubject("判断题");
                s.setEasySubject("困难");
            }
            if (s.getSubjectEasy().equals("D")) {
                s.setEasySubject("非常困难");
            }
        }
        PageInfo<SubjectInfo> pageInfo = new PageInfo<>(subjectInfoList);
        return pageInfo;
    }

    @Override
    public void insertByExcel(Integer fileInfoId) {
        InputStream is = null;
        // 获取file对象
        FileInfo file = fileInfoMapper.selectById(fileInfoId);
        String fileName = file.getAccessUrl();
        fileName = fileName.substring(7);
        System.out.println("----fileName---" + fileName.toString());
        String path = FileConfig.UPLOAD_PATH + File.separator + fileName;
        List<SubjectInfo> subjectInfoList = new ArrayList<>();
        try {
            //判断Excel的格式(.xls或.xlsx)
            if (fileName.toString().endsWith(".xls")) {
                subjectInfoList = PoiUtil.importExcelXLS(path);
            } else {
                subjectInfoList = PoiUtil.importExcelXLSX(path);
            }
            for (SubjectInfo subjectInfo :
                    subjectInfoList) {
                //查询课程id
                Integer courseId = courseInfoMapper.selectByCourseId(subjectInfo.getCourseName());
                subjectInfo.setCourseId(courseId);

                //查询年级id
                Integer gradeId = gradeInfoMapper.selectByGradeId(subjectInfo.getGradeName());
                subjectInfo.setClassInfoId(gradeId);
            }
            System.out.println("插入数据：" + subjectInfoList);
            // 调用mapper层增加方法
            subjectInfoMapper.insertData(subjectInfoList);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public int insertData(List<SubjectInfo> subjectInfoList) {
        int num = subjectInfoMapper.insertData(subjectInfoList);
        return num;
    }

    @Override
    public List<SubjectInfo> selectAll() {
        return subjectInfoMapper.selectAll();
    }

    @Override
    public List<GradeInfo> listGradeInfo() {
        return gradeInfoMapper.listByGradeInfo();
    }

	@Override
	public List<SubjectInfo> listByCourseId(Integer courseId, Integer n) {
		return subjectInfoMapper.listByCourseId(courseId,n);
	}
}
