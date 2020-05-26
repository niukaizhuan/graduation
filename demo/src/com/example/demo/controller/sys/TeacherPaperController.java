package com.example.demo.controller.sys;

import com.example.demo.service.sys.TeacherPaperService;
import com.example.demo.util.sys.ServerResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 试卷信息控制器
 * 
 * @author admin
 *
 */
@CrossOrigin
@RestController
@RequestMapping("/api/teacher")
public class TeacherPaperController {
	@Autowired
	private TeacherPaperService teacherPaperService;

	/**
	 * 获取成绩列表信息
	 * 
	 * @return
	 */
	@RequestMapping("/getTeacherPapersList")
	public ServerResponse getTeacherPapersList() {
		Map<String, Object> map = new HashMap<>();
		List<Map<String, Object>> papersList = teacherPaperService.getPapersList();
		map.put("papersList", papersList);
		List<Map<String, Object>> langOptions = teacherPaperService.getLangOptions();
		map.put("langOptions", langOptions);
		return ServerResponse.createBySuccess("获取全部试卷信息成功", map);
	}

	/**
	 * 获取搜索试卷列表信息
	 * 
	 * @param paperName
	 * @param langId
	 * @param paperType
	 * @return
	 */
	@RequestMapping("/searchPapersList")
	public ServerResponse searchPapersList(@RequestParam("paperName") String paperName,
			@RequestParam("langId") Integer langId, @RequestParam("paperType") Integer paperType) {
		List<Map<String, Object>> resultList = teacherPaperService.searchPapersList(paperName, langId, paperType);
		return ServerResponse.createBySuccess("获取搜索试卷信息成功", resultList);
	}

	/**
	 * 删除选中试卷信息
	 * 
	 * @param obj
	 * @return
	 */
	@RequestMapping(value = "/deletePaper", method = RequestMethod.POST)
	public ServerResponse deletePaper(@RequestBody Map<String, Object> obj) {
		Integer paperId = (Integer) obj.get("paperId");
		int selectResult = teacherPaperService.selectPaperScoreByPaperId(paperId);
		if (selectResult > 0) {
			return ServerResponse.createByError("该试卷已有学生参加考试，删除失败");
		} else {
			int deleteResult = teacherPaperService.deletePaper(paperId);
			if (deleteResult > 0) {
				return ServerResponse.createBySuccess("删除成功", null);
			} else {
				return ServerResponse.createByError("数据库错误，删除失败");
			}
		}
	}

	/**
	 * 获取选中试卷问题详情
	 * 
	 * @param paperId
	 * @param totalNum
	 * @return
	 */
	@RequestMapping("/getPaperQueDetailByPaperId")
	public ServerResponse getPaperQueDetailByPaperId(@RequestParam("paperId") Integer paperId,
			@RequestParam("totalNum") Integer totalNum) {
		Map<String, Object> resultMap = teacherPaperService.getPaperQueDetailByPaperId(paperId, totalNum);
		return ServerResponse.createBySuccess("获取选中试卷问题详情成功", resultMap);
	}

	/**
	 * 请求随机组卷，插入试卷数据，即发布试卷
	 * 
	 * @param obj
	 * @return
	 */
	@RequestMapping(value = "/randomInsertPaperInfo", method = RequestMethod.POST)
	public ServerResponse randomInsertPaperInfo(@RequestBody Map<String, Object> obj) {
		int langId = (int) obj.get("langId");
		if (langId > 1) {
			return ServerResponse.createByError("且慢，该科目题库不足，目前只有java科目题库比较充沛");
		} else {
			int result = teacherPaperService.randomInsertPaperInfo(obj);
			if (result > 0) {
				return ServerResponse.createBySuccess("试卷发布成功", result);
			} else {
				return ServerResponse.createByError("数据库错误，试卷发布失败");
			}
		}
	}

	/**
	 * 通过langId获取科目下的所有问题
	 * 
	 * @param langId
	 * @return
	 */
	@RequestMapping("/getPaperQueDetailByLangId")
	public ServerResponse getPaperQueDetailByLangId(@RequestParam("langId") Integer langId) {
		Map<String, Object> resultMap = teacherPaperService.getPaperQueDetailByLangId(langId);
		return ServerResponse.createBySuccess("获取选中科目下所有问题成功", resultMap);
	}

	/**
	 * 请求固定组卷，插入试卷数据，即发布试卷
	 * 
	 * @param obj
	 * @return
	 */
	@RequestMapping(value = "/fixedInsertPaperInfo", method = RequestMethod.POST)
	public ServerResponse fixedInsertPaperInfo(@RequestBody Map<String, Object> obj) {
		int result = teacherPaperService.fixedInsertPaperInfo(obj);
		if (result > 0) {
			return ServerResponse.createBySuccess("试卷发布成功", result);
		} else {
			return ServerResponse.createByError("数据库错误，试卷发布失败");
		}
	}
}
