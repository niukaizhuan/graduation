package com.example.demo.controller.schedule;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.demo.entity.CoursePlan;
import com.example.demo.service.CoursePlanService;
import com.example.demo.util.ResponseUtil;
import com.example.demo.util.StringUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/schedule/coursePlan")
public class CoursePlanController {
    @Autowired
    private CoursePlanService coursePlanService;



    /**
     * 插入课程计划
     *
     * @param coursePlan
     */
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public void insert(@RequestBody CoursePlan coursePlan) {
        coursePlanService.insert(coursePlan);
    }

    /**
     * 更新
     *
     * @param coursePlan
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void update(@RequestBody CoursePlan coursePlan) {
        coursePlanService.update(coursePlan);
    }

    /**
     * 逻辑删除教室信息
     *
     * @param id 成绩标识(Integer----长度5)
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void delete(@RequestBody Integer id) {
        coursePlanService.delete(id);
    }

    /**
     * 批量逻辑删除教室信息
     *
     * @param id 成绩标识(Integer----长度5)
     * @return 成功删除的记录数
     */
    @RequestMapping(value = "/deleteSelection", method = RequestMethod.POST)
    public Integer deleteSelection(@RequestBody List<Integer> idList) {
        return coursePlanService.deleteSelection(idList);
    }

    /**
     * 过滤查询
     *
     * @return
     */
    @RequestMapping(value = "/listByCoursePlan", method = RequestMethod.POST)
    public PageInfo<CoursePlan> listByCoursePlan(@RequestBody String str) {
        // 使用fastjson转为json对象
        JSONObject strj = JSON.parseObject(str);
        CoursePlan coursePlan = new CoursePlan();
        // 过滤查询条件
        coursePlan.setSchoolNo(StringUtil.isEmpty(strj.getString("schoolNo")) ? null :strj.getString("schoolNo"));
        coursePlan.setClassNo(StringUtil.isEmpty(strj.getString("classNo")) ? null :strj.getString("classNo"));
        coursePlan.setClassroomNo(StringUtil.isEmpty(strj.getString("classroomNo")) ? null :strj.getString("classroomNo"));
        coursePlan.setCourseNo(StringUtil.isEmpty(strj.getString("courseNo")) ? null :strj.getString("courseNo"));
        coursePlan.setStaffNo(StringUtil.isEmpty(strj.getString("staffNo")) ? null :strj.getString("staffNo"));
        coursePlan.setTermName(StringUtil.isEmpty(strj.getString("termName")) ? null :strj.getString("termName"));
       // 当前页码
        int pageNum = strj.getIntValue("pageNum");
        // 页面大小
        int pageSize = strj.getIntValue("pageSize");
        return coursePlanService.listByCoursePlan(coursePlan, pageNum, pageSize);
    }


    @RequestMapping(value = "/selectAll", method = RequestMethod.POST)
    public String selectAll(){
        return ResponseUtil.success(coursePlanService.selectAll());
    }
}
