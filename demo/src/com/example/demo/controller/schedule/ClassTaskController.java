package com.example.demo.controller.schedule;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.demo.entity.ClassTask;
import com.example.demo.service.ClassSchedulingService;
import com.example.demo.service.ClassTaskService;
import com.example.demo.util.ResponseUtil;
import com.example.demo.util.StringUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 开课任务控制器
 */
@RestController
@RequestMapping("/schedule/classTask")
public class ClassTaskController {
    @Autowired
    private ClassTaskService classTaskService;

    //排课业务
    @Autowired
    private ClassSchedulingService classSchedulingService;

    /**
     * 插入开课任务
     *
     * @param classTask
     */
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public void insert(@RequestBody ClassTask classTask) {
        classTaskService.insert(classTask);
    }

    /**
     * 更新
     *
     * @param classTask
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void update(@RequestBody ClassTask classTask) {
        classTaskService.update(classTask);
    }

    /**
     * 逻辑删除教室信息
     *
     * @param id 成绩标识(Integer----长度5)
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void delete(@RequestBody Integer id) {
        classTaskService.delete(id);
    }

    /**
     * 批量逻辑删除教室信息
     *
     * @param idList 成绩标识(Integer----长度5)
     * @return 成功删除的记录数
     */
    @RequestMapping(value = "/deleteSelection", method = RequestMethod.POST)
    public Integer deleteSelection(@RequestBody List<Integer> idList) {
        return classTaskService.deleteSelection(idList);
    }

    /**
     * 过滤查询
     *
     * @return
     */
    @RequestMapping(value = "/listByClassTask", method = RequestMethod.POST)
    public PageInfo<ClassTask> listByClassTask(@RequestBody String str) {
        // 使用fastjson转为json对象
        JSONObject strj = JSON.parseObject(str);
        ClassTask classTask = new ClassTask();
        // 过滤查询条件
        //学期id
        classTask.setTermName(StringUtil.isEmpty(strj.getString("termName")) ? null : strj.getString("termName"));
        classTask.setClassNo(StringUtil.isEmpty(strj.getString("classNo")) ? null : strj.getString("classNo"));
        classTask.setSchoolNo(StringUtil.isEmpty(strj.getString("schoolNo")) ? null : strj.getString("schoolNo"));
        classTask.setCourseNo(StringUtil.isEmpty(strj.getString("courseNo")) ? null : strj.getString("courseNo"));
        classTask.setStaffNo(StringUtil.isEmpty(strj.getString("staffNo")) ? null : strj.getString("staffNo"));
        classTask.setCourseAttr(StringUtil.isEmpty(strj.getString("courseAttr")) ? null : strj.getString("courseAttr"));
        // 当前页码
        int pageNum = strj.getIntValue("pageNum");
        // 页面大小
        int pageSize = strj.getIntValue("pageSize");
        return classTaskService.listByClassTask(classTask, pageNum, pageSize);
    }

    /**
     * 排课
     */
    @RequestMapping(value = "/classScheduling", method = RequestMethod.POST)
    public String classScheduling(@RequestBody String str){
        // 使用fastjson转为json对象
        JSONObject strj = JSON.parseObject(str);
        ClassTask classTask = new ClassTask();
        classTask.setTermName(StringUtil.isEmpty(strj.getString("termName")) ? null : strj.getString("termName"));
//        return ResponseUtil.success(classSchedulingService.classScheduling(classTask));
        return ResponseUtil.success("Success");
    }

}
