package com.example.demo.service.sys;

import com.example.demo.entity.sys.ProgramingLanguage;

import java.util.List;
import java.util.Map;

public interface AdminSubjectService {
	/**
	 * 获取全部科目信息
	 * 
	 * @return
	 */
	public List<Map<String, Object>> getSubjectsList();

	/**
	 * 获取搜索科目信息
	 * 
	 * @param langName
	 * @param langDesc
	 * @param langCreatedBy
	 * @param isRecommend
	 * @return
	 */
	public List<Map<String, Object>> searchSubjectsList(String langName, String langDesc, String langCreatedBy,
			String isRecommend);

	/**
	 * 添加科目信息
	 * 
	 * @param programingLanguage
	 * @return
	 */
	public int insertSubjectInfo(ProgramingLanguage programingLanguage);

	/**
	 * 更新科目信息
	 * 
	 * @param programingLanguage
	 * @return
	 */
	public int updateSubjectInfo(ProgramingLanguage programingLanguage);

	/**
	 * 删除科目信息
	 * 
	 * @param langId
	 * @return
	 */
	public int deleteSubject(Integer langId);
}
