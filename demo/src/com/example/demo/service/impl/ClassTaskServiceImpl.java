package com.example.demo.service.impl;

import com.example.demo.entity.ClassTask;
import com.example.demo.mapper.ClassTaskMapper;
import com.example.demo.service.ClassTaskService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassTaskServiceImpl implements ClassTaskService {
    @Autowired
    private ClassTaskMapper classTaskMapper;

    @Override
    public List<ClassTask> listClassTask() {
        return classTaskMapper.listClassTask();
    }

    @Override
    public void delete(Integer id) {
        classTaskMapper.delete(id);
    }

    @Override
    public Integer deleteSelection(List<Integer> idList) {
        return classTaskMapper.deleteSelection(idList);
    }

    @Override
    public void insert(ClassTask classTask) {
    	classTask.setCourseAttr("01");
        classTaskMapper.insert(classTask);
    }

    @Override
    public void update(ClassTask classTask) {
        classTaskMapper.update(classTask);
    }

    @Override
    public ClassTask selectById(Integer id) {
        return classTaskMapper.selectById(id);
    }

    @Override
    public PageInfo<ClassTask> listByClassTask(ClassTask classTask, Integer pageNum, Integer pageSize) {
        // 设置分页参数
        PageHelper.startPage(pageNum, pageSize);
        // 查询集合
        List<ClassTask> classTaskList = classTaskMapper.listByClassTask(classTask);
        for (ClassTask c :
                classTaskList) {
            if(c.getIsFix().equals("1")){
                c.setIsFix("是");
            }else {
                c.setIsFix("否");
            }
            
        }
        System.out.println("slassTsak:"+classTaskList.get(0));
        PageInfo<ClassTask> pageInfo = new PageInfo<>(classTaskList);
        return pageInfo;
    }
}
