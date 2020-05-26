package com.example.demo.controller.sys;

import com.example.demo.entity.sys.Student;
import com.example.demo.service.sys.StudentSystemService;
import com.example.demo.service.sys.TeacherStudentService;
import com.example.demo.util.sys.ServerResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 学生管理控制器
 * 
 * @author admin
 *
 */
@CrossOrigin
@RestController
@RequestMapping("/api/teacher")
public class TeacherStudentController {
	@Autowired
	private TeacherStudentService teacherStudentService;
	@Autowired
	private StudentSystemService studentSystemService;

	/**
	 * 获取学生列表信息
	 * 
	 * @return
	 */
	@RequestMapping("/getStudentsList")
	public ServerResponse getStudentsList() {
		List<Student> resultList = teacherStudentService.getStudentsList();
		return ServerResponse.createBySuccess("获取全部学生信息成功", resultList);
	}

	/**
	 * 更新学生信息
	 * 
	 * @param student
	 * @return
	 */
	@RequestMapping(value = "/updateStudentInfo", method = RequestMethod.POST)
	public ServerResponse updateStudentInfo(@RequestBody(required = false) Student student) {
		int result = teacherStudentService.updateStudentInfo(student);
		if (result > 0) {
			return ServerResponse.createBySuccess("更新学生信息成功", null);
		} else {
			return ServerResponse.createByError("数据库错误，更新学生信息失败");
		}
	}

	/**
	 * 获取搜索学生列表信息
	 * 
	 * @param sno
	 * @param stuName
	 * @param stuSex
	 * @return
	 */
	@RequestMapping("/searchStudentInfo")
	public ServerResponse searchStudentInfo(@RequestParam("sno") String sno, @RequestParam("stuName") String stuName,
			@RequestParam("stuSex") String stuSex) {
		List<Student> resultList = teacherStudentService.searchStudentInfo(sno, stuName, stuSex);
		return ServerResponse.createBySuccess("获取搜索学生信息成功", resultList);
	}

	/**
	 * 添加学生信息
	 * 
	 * @param student
	 * @return
	 */
	@RequestMapping(value = "/insertStudentInfo", method = RequestMethod.POST)
	public ServerResponse insertStudentInfo(@RequestBody(required = false) Student student) {
		boolean isRegistered = studentSystemService.snoIsExist(student.getSno());
		if (isRegistered) {
			return ServerResponse.createByError("此学号已被注册");
		}
		student.setStuCreateTime(new Date());
		int result = teacherStudentService.insertStudentInfo(student);
		if (result > 0) {
			return ServerResponse.createBySuccess("插入学生信息成功", null);
		} else {
			return ServerResponse.createByError("数据库错误，插入学生信息失败");
		}
	}

	/**
	 * 获取成绩列表信息
	 * 
	 * @return
	 */
	@RequestMapping("/getScoresList")
	public ServerResponse getScoresList() {
		Map<String, Object> map = new HashMap<>();
		List<Map<String, Object>> scoresList = teacherStudentService.getScoresList();
		map.put("scoresList", scoresList);
		List<Map<String, Object>> papersList = teacherStudentService.getPapersList();
		map.put("papersList", papersList);
		return ServerResponse.createBySuccess("获取全部成绩信息成功", map);
	}

	/**
	 * 删除学生成绩
	 * 
	 * @param obj
	 * @return
	 */
	@RequestMapping(value = "/deleteScore", method = RequestMethod.POST)
	public ServerResponse deleteScore(@RequestBody Map<String, Object> obj) {
		String sno = (String) obj.get("sno");
		Integer paperId = (Integer) obj.get("paperId");
		int result = teacherStudentService.deleteScore(sno, paperId);
		if (result > 0) {
			return ServerResponse.createBySuccess("删除成功", null);
		} else {
			return ServerResponse.createByError("数据库错误，删除失败");
		}
	}

	/**
	 * 获取搜索成绩列表信息
	 * 
	 * @param sno
	 * @param paperId
	 * @return
	 */
	@RequestMapping("/searchScoresList")
	public ServerResponse searchScoresList(@RequestParam("sno") String sno, @RequestParam("paperId") Integer paperId) {
		List<Map<String, Object>> resultList = teacherStudentService.searchScoresList(sno, paperId);
		return ServerResponse.createBySuccess("获取搜索成绩信息成功", resultList);
	}

	/**
	 * 获取全部已发布试卷信息
	 * 
	 * @return
	 */
	@RequestMapping("/getPapersList")
	public ServerResponse getPapersList() {
		Map<String, Object> map = new HashMap<>();
		List<Map<String, Object>> papersList = teacherStudentService.getPapersList();
		map.put("papersList", papersList);
		return ServerResponse.createBySuccess("获取全部成绩信息成功", map);
	}

	/**
	 * 获取成绩图标数据
	 * 
	 * @param paperId
	 * @return
	 */
	@RequestMapping("/getChartData")
	public ServerResponse getChartData(@RequestParam("paperId") Integer paperId) {
		Map<String, Object> resultMap = teacherStudentService.getChartData(paperId);
		return ServerResponse.createBySuccess("获取成绩图标数据成功", resultMap);
	}

	/**
	 * 添加导入学生信息Excel文件
	 * 
	 * @param obj
	 * @return
	 */
	@RequestMapping(value = "/insertStudentInfoList", method = RequestMethod.POST)
	public ServerResponse insertStudentInfoList(@RequestBody Map<String, Object> obj) {
		List<Map<String, Object>> studentList = (List<Map<String, Object>>) obj.get("studentList");
		Map<String, Object> result = teacherStudentService.insertStudentInfoList(studentList);
		return ServerResponse.createBySuccess("文件上传成功", result);
	}
}
