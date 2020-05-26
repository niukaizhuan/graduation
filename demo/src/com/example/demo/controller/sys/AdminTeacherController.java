package com.example.demo.controller.sys;

import com.example.demo.entity.sys.Teacher;
import com.example.demo.service.sys.AdminTeacherService;
import com.example.demo.util.sys.ServerResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 教师信息控制器
 * 
 * @author admin
 *
 */
@CrossOrigin
@RestController
@RequestMapping("/api/admin")
public class AdminTeacherController {

	@Autowired
	private AdminTeacherService adminTeacherService;

	/**
	 * 添加导入教师信息Excel文件
	 * 
	 * @param obj
	 * @return
	 */
	@RequestMapping(value = "/insertTeacherInfoList", method = RequestMethod.POST)
	public ServerResponse insertTeacherInfoList(@RequestBody Map<String, Object> obj) {
		List<Map<String, Object>> teacherList = (List<Map<String, Object>>) obj.get("teacherList");
		Map<String, Object> result = adminTeacherService.insertTeacherInfoList(teacherList);
		return ServerResponse.createBySuccess("文件上传成功", result);
	}

	/**
	 * 获取教师列表信息
	 * 
	 * @return
	 */
	@RequestMapping("/getTeachersList")
	public ServerResponse getTeachersList() {
		List<Teacher> resultList = adminTeacherService.getTeachersList();
		return ServerResponse.createBySuccess("获取全部教师信息成功", resultList);
	}

	/**
	 * 更新教师信息
	 * 
	 * @param teacher
	 * @return
	 */
	@RequestMapping(value = "/updateTeacherInfo", method = RequestMethod.POST)
	public ServerResponse updateTeacherInfo(@RequestBody(required = false) Teacher teacher) {
		int result = adminTeacherService.updateTeacherInfo(teacher);
		if (result > 0) {
			return ServerResponse.createBySuccess("更新教师信息成功", null);
		} else {
			return ServerResponse.createByError("数据库错误，更新教师信息失败");
		}
	}

	/**
	 * 获取搜索教师列表信息
	 * 
	 * @param tno
	 * @param teaName
	 * @param teaSex
	 * @return
	 */
	@RequestMapping("/searchTeacherInfo")
	public ServerResponse searchTeacherInfo(@RequestParam("tno") String tno, @RequestParam("teaName") String teaName,
			@RequestParam("teaSex") String teaSex) {
		List<Teacher> resultList = adminTeacherService.searchTeacherInfo(tno, teaName, teaSex);
		return ServerResponse.createBySuccess("获取搜索教师信息成功", resultList);
	}

	/**
	 * 添加教师信息
	 * 
	 * @param teacher
	 * @return
	 */
	@RequestMapping(value = "/insertTeacherInfo", method = RequestMethod.POST)
	public ServerResponse insertTeacherInfo(@RequestBody(required = false) Teacher teacher) {
		boolean isRegistered = adminTeacherService.tnoIsExist(teacher.getTno());
		if (isRegistered) {
			return ServerResponse.createByError("此教工号已被注册");
		}
		int result = adminTeacherService.insertTeacherInfo(teacher);
		if (result > 0) {
			return ServerResponse.createBySuccess("插入教师信息成功", null);
		} else {
			return ServerResponse.createByError("数据库错误，插入教师信息失败");
		}
	}
}
