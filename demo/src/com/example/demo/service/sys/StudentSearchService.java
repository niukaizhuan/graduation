package com.example.demo.service.sys;

import java.util.List;
import java.util.Map;

public interface StudentSearchService {
	/**
	 * 根据关键词获取试卷列表数据
	 * 
	 * @param keyword
	 * @return
	 */
	public List<Map<String, Object>> getSearchPapers(String keyword);
}
