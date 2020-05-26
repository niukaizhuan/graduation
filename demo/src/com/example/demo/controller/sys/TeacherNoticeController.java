package com.example.demo.controller.sys;

import com.example.demo.entity.sys.TeacherNotice;
import com.example.demo.service.sys.TeacherNoticeService;
import com.example.demo.util.sys.ServerResponse;
import com.example.demo.util.sys.websocket.WebSocketDemo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 公告信息控制器
 * 
 * @author admin
 *
 */
@CrossOrigin
@RestController
@RequestMapping("/api/teacher")
public class TeacherNoticeController {
	@Autowired
	private TeacherNoticeService teacherNoticeService;

	/**
	 * 获取公告列表信息
	 * 
	 * @return
	 */
	@RequestMapping("/getNoticesList")
	public ServerResponse getNoticesList() {
		List<Map<String, Object>> resultList = teacherNoticeService.getNoticesList();
		return ServerResponse.createBySuccess("获取全部公告信息成功", resultList);
	}

	/**
	 * 获取搜索公告列表信息
	 * 
	 * @param noticeContent
	 * @param teaName
	 * @return
	 */
	@RequestMapping("/searchNoticesList")
	public ServerResponse searchNoticesList(@RequestParam("noticeContent") String noticeContent,
			@RequestParam("teaName") String teaName) {
		List<Map<String, Object>> resultList = teacherNoticeService.searchNoticeInfo(noticeContent, teaName);
		return ServerResponse.createBySuccess("获取搜索公告信息成功", resultList);
	}

	/**
	 * 更新公告信息
	 * 
	 * @param teacherNotice
	 * @return
	 */
	@RequestMapping(value = "/updateNoticeInfo", method = RequestMethod.POST)
	public ServerResponse updateNoticeInfo(@RequestBody(required = false) TeacherNotice teacherNotice) {
		int result = teacherNoticeService.updateNoticeInfo(teacherNotice);
		if (result > 0) {
			return ServerResponse.createBySuccess("更新公告信息成功", null);
		} else {
			return ServerResponse.createByError("数据库错误，更新公告信息失败");
		}
	}

	/**
	 * 添加公告信息
	 * 
	 * @param teacherNotice
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/insertNoticeInfo", method = RequestMethod.POST)
	public ServerResponse insertNoticeInfo(@RequestBody(required = false) TeacherNotice teacherNotice)
			throws IOException {
		boolean noticeContentIsExist = teacherNoticeService.noticeContentIsExist(teacherNotice.getNoticeContent());
		if (noticeContentIsExist) {
			return ServerResponse.createByError("此公告内容已存在，请创新新的公告内容");
		}

		teacherNotice.setNoticeCreateTime(new Date());
		int result = teacherNoticeService.insertNoticeInfo(teacherNotice);
		if (result > 0) {
			// 插入公告时向学生推送消息
			ConcurrentHashMap<String, WebSocketDemo> webSocketSet = WebSocketDemo.getWebSocketDemo();
			for (String key : webSocketSet.keySet()) {
				if (key.length() == 12) {
					webSocketSet.get(key).sendMessage("公告");
				}
			}
			return ServerResponse.createBySuccess("插入公告信息成功", null);
		} else {
			return ServerResponse.createByError("数据库错误，插入公告信息失败");
		}
	}

	/**
	 * 删除公告信息
	 * 
	 * @param obj
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/deleteNotice", method = RequestMethod.POST)
	public ServerResponse deleteScore(@RequestBody Map<String, Object> obj) throws IOException {
		Integer noticeId = (Integer) obj.get("noticeId");
		int result = teacherNoticeService.deleteNotice(noticeId);
		if (result > 0) {
			// 删除公告时向学生推送消息
			ConcurrentHashMap<String, WebSocketDemo> webSocketSet = WebSocketDemo.getWebSocketDemo();
			for (String key : webSocketSet.keySet()) {
				if (key.length() == 12) {
					webSocketSet.get(key).sendMessage("公告");
				}
			}
			return ServerResponse.createBySuccess("删除成功", null);
		} else {
			return ServerResponse.createByError("数据库错误，删除失败");
		}
	}
}
