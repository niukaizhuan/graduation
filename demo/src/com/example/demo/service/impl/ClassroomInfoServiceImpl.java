package com.example.demo.service.impl;

import com.example.demo.entity.ClassroomInfo;
import com.example.demo.mapper.ClassroomInfoMapper;
import com.example.demo.service.ClassroomInfoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassroomInfoServiceImpl implements ClassroomInfoService {

    @Autowired
    private ClassroomInfoMapper classroomInfoMapper;

    @Override
    public List<ClassroomInfo> listClassroomInfo() {
        return classroomInfoMapper.listClassroomInfo();
    }

    @Override
    public void delete(Integer id) {
        classroomInfoMapper.delete(id);
    }

    @Override
    public Integer deleteSelection(List<Integer> idList) {
        return classroomInfoMapper.deleteSelection(idList);
    }

    @Override
    public String insert(ClassroomInfo classroomInfo) {
        int result = classroomInfoMapper.countByClassroomInfo(classroomInfo);
        if (result > 0) {
            return "exist";
        }
        classroomInfoMapper.insert(classroomInfo);
        return null;
    }

    @Override
    public String update(ClassroomInfo classroomInfo) {
        int result = classroomInfoMapper.countByClassroomInfo(classroomInfo);
        if (result > 0) {
            return "exist";
        }
        classroomInfoMapper.update(classroomInfo);
        return null;
    }

    @Override
    public ClassroomInfo selectById(Integer id) {
        return classroomInfoMapper.selectById(id);
    }

    @Override
    public PageInfo<ClassroomInfo> listByClassroomInfo(ClassroomInfo classroomInfo, Integer pageNum, Integer pageSize) {
        // 设置分页参数
        PageHelper.startPage(pageNum, pageSize);
        // 查询集合
        List<ClassroomInfo> classroomInfoList = classroomInfoMapper.listByClassroomInfo(classroomInfo);
        for (ClassroomInfo c :
                classroomInfoList) {
            if(c.getClassroomAttr().equals("A")){
                c.setClassroomAttr("多功能教室");
            } else if(c.getClassroomAttr().equals("B")){
                c.setClassroomAttr("自习室");
            } else if(c.getClassroomAttr().equals("C")){
                c.setClassroomAttr("考研室");
            } else {
                c.setClassroomAttr("实验机房");
            }
        }
        PageInfo<ClassroomInfo> pageInfo = new PageInfo<ClassroomInfo>(classroomInfoList);
        return pageInfo;
    }

}
