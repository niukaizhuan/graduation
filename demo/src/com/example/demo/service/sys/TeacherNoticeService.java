package com.example.demo.service.sys;

import com.example.demo.entity.sys.TeacherNotice;

import java.util.List;
import java.util.Map;

public interface TeacherNoticeService {
	/**
	 * 获取公告列表信息
	 * 
	 * @return
	 */
	public List<Map<String, Object>> getNoticesList();

	/**
	 * 获取搜索公告列表信息
	 * 
	 * @param noticeContent
	 * @param teaName
	 * @return
	 */
	public List<Map<String, Object>> searchNoticeInfo(String noticeContent, String teaName);

	/**
	 * 
	 * @param noticeContent
	 * @return
	 */
	public boolean noticeContentIsExist(String noticeContent);

	/**
	 * 添加公告信息
	 * 
	 * @param teacherNotice
	 * @return
	 */
	public int insertNoticeInfo(TeacherNotice teacherNotice);

	/**
	 * 更新公告信息
	 * 
	 * @param teacherNotice
	 * @return
	 */
	public int updateNoticeInfo(TeacherNotice teacherNotice);

	/**
	 * 删除公告信息
	 * 
	 * @param noticeId
	 * @return
	 */
	public int deleteNotice(Integer noticeId);
}
