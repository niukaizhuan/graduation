package com.example.demo.view;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 系统管理模块视图跳转<br>
 * 注意：<br>
 * 1、请求路径唯一，切勿与其他任何请求路径重复<br>
 * 2、请求返回的视图，切勿与其他任何请求路径重复<br>
 */
@Controller
@RequestMapping("info")
public class ManageView {

	@RequestMapping("/course_info")
    public String courseInfo(){
       return "info/courseInfo";
    }
    @RequestMapping("/specialty_")
    public String specialty(){
        return "info/specialty";
    }
    @RequestMapping("/student_info")
    public String studentInfo(){
        return "info/studentInfo";
    }
    @RequestMapping("/subject_info")
    public String subjectInfo(){
        return "info/subjectInfo";
    }
    @RequestMapping("/class_info")
    public String classInfo(){
        return "info/classInfo";
    }
    @RequestMapping("/school_info")
    public String schoolInfo(){
        return "info/schoolInfo";
    }
    @RequestMapping("/staff_info")
    public String staffInfo(){
        return "info/staffInfo";
    }
    @RequestMapping("/score_info")
    public String scoreInfo(){
        return "info/scoreInfo";
    }
    @RequestMapping("/subject_test")
    public String test(){
        return "info/test";
    }
}
