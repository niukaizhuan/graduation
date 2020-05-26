package com.example.demo.controller.sys;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.demo.entity.ClassInfo;
import com.example.demo.entity.ClassTask;
import com.example.demo.entity.CourseInfo;
import com.example.demo.entity.SchoolInfo;
import com.example.demo.entity.StaffInfo;
import com.example.demo.entity.YearTerm;
import com.example.demo.entity.sys.ProgramingLanguage;
import com.example.demo.service.ClassInfoService;
import com.example.demo.service.ClassSchedulingService;
import com.example.demo.service.ClassTaskService;
import com.example.demo.service.CourseInfoService;
import com.example.demo.service.CoursePlanService;
import com.example.demo.service.SchoolInfoService;
import com.example.demo.service.StaffInfoService;
import com.example.demo.service.YearTermService;
import com.example.demo.service.sys.AdminSubjectService;
import com.example.demo.util.ResponseUtil;
import com.example.demo.util.StringUtil;
import com.example.demo.util.sys.ServerResponse;
import com.github.pagehelper.PageInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 考试科目控制器 开课任务控制器
 * @CrossOrigin 解决跨域问题
 * @author admin
 *
 */
@CrossOrigin
@RestController
@RequestMapping("/api/admin")
public class AdminSubjectController {
	// 考试科目业务
	@Autowired
	private AdminSubjectService adminSubjectService;
	// 课程计划业务
	@Autowired
	private CoursePlanService coursePlanService;
	// 班级信息业务
	@Autowired
	private ClassInfoService classInfoService;
	// 开课任务业务
	@Autowired
	private ClassTaskService classTaskService;
	// 学期信息业务
	@Autowired
	private YearTermService yearTermService;
	// 学院信息业务
	@Autowired
	private SchoolInfoService schoolInfoService;
	// 教室信息业务
	@Autowired
	private StaffInfoService staffInfoService;
	// 课程信息业务
	@Autowired
	private CourseInfoService courseInfoService;
	// 排课业务
	@Autowired
	private ClassSchedulingService classSchedulingService;

	/**
	 * 排课
	 * 
	 * @param str
	 * @return
	 */
	@RequestMapping(value = "/classScheduling", method = RequestMethod.POST)
	public String classScheduling(@RequestBody String str) {
		// 使用fastjson转为json对象
		JSONObject strj = JSON.parseObject(str);
		ClassTask classTask = new ClassTask();
		classTask.setTermName(StringUtil.isEmpty(strj.getString("termName")) ? null : strj.getString("termName"));
		return ResponseUtil.success(classSchedulingService.classScheduling(classTask));
	}

	/**
	 * 插入开课任务
	 *
	 * @param classTask
	 */
	@RequestMapping(value = "/insertClassTask", method = RequestMethod.POST)
	public void insert(@RequestBody ClassTask temp) {
		classTaskService.insert(temp);
	}

	/**
	 * 更新开课任务
	 *
	 * @param classTask
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public void update(@RequestBody ClassTask classTask) {
		classTaskService.update(classTask);
	}

	/**
	 * 逻辑删除开课任务
	 *
	 * @param id
	 */
	@RequestMapping("/delete")
	public void delete(@RequestParam("id") Integer id) {
		classTaskService.delete(id);
	}

	/**
	 * 查询开课任务
	 * 
	 * @param str
	 * @return
	 */
	@RequestMapping(value = "/listByClassTask", method = RequestMethod.POST)
	public PageInfo<ClassTask> listByClassTask(@RequestBody String str) {
		// 使用fastjson转为json对象
		JSONObject strj = JSON.parseObject(str);
		ClassTask classTask = new ClassTask();
		// 过滤查询条件
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
	 * 获取学年信息
	 * 
	 * @return
	 */
	@RequestMapping("/selectYearTermList")
	public List<YearTerm> selectYearTermList() {
		List<YearTerm> yearTermList = yearTermService.selectYearTermList();
		return yearTermList;
	}

	/**
	 * 获取学院信息
	 * 
	 * @return
	 */
	@RequestMapping("/selectSchoolInfoList")
	public List<SchoolInfo> selectSchoolInfoList() {
		return schoolInfoService.selectSchoolInfoList();
	}

	/**
	 * 获取教师信息
	 * 
	 * @return
	 */
	@RequestMapping("/selectStaffInfoList")
	public List<StaffInfo> selectStaffInfoList() {
		List<StaffInfo> staffInfoList = staffInfoService.selectStaffInfoList();
		return staffInfoList;
	}

	/**
	 * 获取课程
	 * 
	 * @return
	 */
	@RequestMapping("/listCourseInfo")
	public List<CourseInfo> listCourseInfo() {
		return courseInfoService.listCourseInfo();
	}

	/**
	 * 获取班级编号列表
	 * 
	 * @return
	 */
	@RequestMapping("/selectClassInfoList")
	public List<ClassInfo> selectClassInfoList() {
		List<ClassInfo> classInfoList = classInfoService.selectClassInfoList();
		return classInfoList;
	}

	/**
	 * 查询课表信息
	 * 
	 * @return
	 */
	@RequestMapping("/selectAll")
	public String selectAll() {
		return ResponseUtil.success(coursePlanService.selectAll());
	}

	/**
	 * 获取全部科目信息
	 * 
	 * @return
	 */
	@RequestMapping("/getSubjectsList")
	public ServerResponse getSubjectsList() {
		List<Map<String, Object>> resultList = adminSubjectService.getSubjectsList();
		return ServerResponse.createBySuccess("获取全部科目信息成功", resultList);
	}

	/**
	 * 获取搜索科目信息
	 * 
	 * @param langName 编程语言名称
	 * @param langDesc 编程语言描述
	 * @param langCreatedBy 编程语言被创建者
	 * @param isRecommend 是否在学生首页显示推荐，默认为0不推荐，1为推荐
	 * @return
	 */
	@RequestMapping("/searchSubjectsList")
	public ServerResponse searchSubjectsList(@RequestParam("langName") String langName,
			@RequestParam("langDesc") String langDesc, @RequestParam("langCreatedBy") String langCreatedBy,
			@RequestParam("isRecommend") String isRecommend) {
		List<Map<String, Object>> resultList = adminSubjectService.searchSubjectsList(langName, langDesc, langCreatedBy,
				isRecommend);
		return ServerResponse.createBySuccess("获取搜索科目信息成功", resultList);
	}

	/**
	 * 添加科目信息
	 * 
	 * @param programingLanguage
	 *            科目实体类
	 * @return
	 */
	@RequestMapping(value = "/insertSubjectInfo", method = RequestMethod.POST)
	public ServerResponse insertSubjectInfo(@RequestBody(required = false) ProgramingLanguage programingLanguage) {
		int result = adminSubjectService.insertSubjectInfo(programingLanguage);
		if (result > 0) {
			return ServerResponse.createBySuccess("添加科目信息成功", null);
		} else {
			return ServerResponse.createByError("数据库错误，添加科目信息失败");
		}
	}

	/**
	 * 更新科目信息
	 * 
	 * @param programingLanguage
	 *            科目实体类
	 * @return
	 */
	@RequestMapping(value = "/updateSubjectInfo", method = RequestMethod.POST)
	public ServerResponse updateSubjectInfo(@RequestBody(required = false) ProgramingLanguage programingLanguage) {
		int result = adminSubjectService.updateSubjectInfo(programingLanguage);
		if (result > 0) {
			return ServerResponse.createBySuccess("更新科目信息成功", null);
		} else {
			return ServerResponse.createByError("数据库错误，更新科目信息失败");
		}
	}

	/**
	 * 删除科目信息
	 * 
	 * @param obj
	 *            科目id
	 * @return
	 */
	@RequestMapping(value = "/deleteSubject", method = RequestMethod.POST)
	public ServerResponse deleteSubject(@RequestBody Map<String, Object> obj) {
		Integer langId = (Integer) obj.get("langId");
		int result = adminSubjectService.deleteSubject(langId);
		if (result > 0) {
			return ServerResponse.createBySuccess("删除成功", null);
		} else {
			return ServerResponse.createByError("数据库错误，删除失败");
		}
	}
}
