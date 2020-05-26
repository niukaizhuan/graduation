package com.example.demo.view;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("schedule")
public class ScheduleView {

//    @RequestMapping("/classroomInfo")
//    public ModelAndView classroomInfo() {
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.addObject("classroomInfo");
//        return modelAndView;
//    }
//
//    @RequestMapping("/classTask")
//    public ModelAndView classTask() {
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.addObject("classTask");
//        return modelAndView;
//    }
//
//    @RequestMapping("/coursePlan")
//    public ModelAndView coursePlan() {
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.addObject("coursePlan");
//        return modelAndView;
//    }
//
//    @RequestMapping("/schoolTeachBuildInfo")
//    public ModelAndView schoolTeachBuildInfo() {
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.addObject("schoolTeachBuildInfo");
//        return modelAndView;
//    }
//
//    @RequestMapping("/teachBuildInfo")
//    public ModelAndView teachBuildInfo() {
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.addObject("teachBuildInfo");
//        return modelAndView;
//    }
//
//    @RequestMapping("/teacherCourse")
//    public ModelAndView teacherCourse() {
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.addObject("teacherCourse");
//        return modelAndView;
//    }
//
//    @RequestMapping("/timetable")
//    public ModelAndView timetable() {
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.addObject("timetable");
//        return modelAndView;
//    }
    
    @RequestMapping("/classroom_info")
    public String classroomInfo() {
        return "schedule/classroomInfo";
    }

    @RequestMapping("/class_task")
    public String classTask() {
        return "schedule/classTask";
    }

    @RequestMapping("/course_plan")
    public String coursePlan() {
        return "schedule/coursePlan";
    }

    @RequestMapping("/schoolTeachBuild_info")
    public String schoolTeachBuildInfo() {
        return "schedule/schoolTeachBuildInfo";
        
    }

    @RequestMapping("/teachBuild_info")
    public String teachBuildInfo() {
        return "schedule/teachBuildInfo";
    }

    @RequestMapping("/teacher_course")
    public String teacherCourse() {
        return "schedule/teacherCourse";
    }

    @RequestMapping("/time_table")
    public String timetable() {
        return "schedule/timetable";
    }

}
