package com.example.demo.controller.schedule;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.demo.entity.TeacherCourse;
import com.example.demo.service.TeacherCourseService;
import com.example.demo.util.StringUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 教师课程安排控制器
 */
@RestController
@RequestMapping("/schedule/teacherCourse")
public class TeacherCourseController {
    @Autowired
    private TeacherCourseService teacherCourseService;


    /**
     * 插入
     *
     * @param teacherCourse
     */
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public void insert(@RequestBody TeacherCourse teacherCourse) {
        teacherCourseService.insert(teacherCourse);
    }

    /**
     * 更新
     *
     * @param teacherCourse
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void update(@RequestBody TeacherCourse teacherCourse) {
        teacherCourseService.update(teacherCourse);
    }

    /**
     * 逻辑删除信息
     *
     * @param id 成绩标识(Integer----长度5)
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void delete(@RequestBody Integer id) {
        teacherCourseService.delete(id);
    }

    /**
     * 批量逻辑删除教室信息
     *
     * @param idList 成绩标识(Integer----长度5)
     * @return 成功删除的记录数
     */
    @RequestMapping(value = "/deleteSelection", method = RequestMethod.POST)
    public Integer deleteSelection(@RequestBody List<Integer> idList) {
        return teacherCourseService.deleteSelection(idList);
    }

    /**
     * 过滤查询
     *
     * @return
     */
    @RequestMapping(value = "/listByTeacherCourse", method = RequestMethod.POST)
    public PageInfo<TeacherCourse> listByTeacherCourse(@RequestBody String str) {
        // 使用fastjson转为json对象
        JSONObject strj = JSON.parseObject(str);
        TeacherCourse teacherCourse = new TeacherCourse();
        // 过滤查询条件
        teacherCourse.setClassNo(StringUtil.isEmpty(strj.getString("classNo")) ? null : strj.getString("classNo"));
        teacherCourse.setCourseNo(StringUtil.isEmpty(strj.getString("courseNo")) ? null : strj.getString("courseNo"));
        teacherCourse.setClassroomNo(StringUtil.isEmpty(strj.getString("classroomNo")) ? null : strj.getString("classroomNo"));
        teacherCourse.setStaffNo(StringUtil.isEmpty(strj.getString("staffNo")) ? null : strj.getString("staffNo"));
        // 当前页码
        int pageNum = strj.getIntValue("pageNum");
        // 页面大小
        int pageSize = strj.getIntValue("pageSize");
        return teacherCourseService.listByTeacherCourse(teacherCourse, pageNum, pageSize);
    }
}
