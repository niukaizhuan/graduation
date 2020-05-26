package com.example.demo.service.impl.sys;

import com.example.demo.mapper.sys.PaperMapper;
import com.example.demo.mapper.sys.ProgramingLanguageMapper;
import com.example.demo.service.sys.StudentSearchService;
import com.example.demo.entity.sys.Paper;
import com.example.demo.entity.sys.PaperExample;
import com.example.demo.entity.sys.ProgramingLanguage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StudentSearchServiceImpl implements StudentSearchService {

	// 试卷mapper
	@Autowired
	PaperMapper paperMapper;
	// 编程语言mapper
	@Autowired
	ProgramingLanguageMapper programingLanguageMapper;

	@Override
	public List<Map<String, Object>> getSearchPapers(String keyword) {

		List<Map<String, Object>> resultList = new ArrayList<>();

		PaperExample paperExample = new PaperExample();
		PaperExample.Criteria criteria = paperExample.createCriteria();
		criteria.andPaperNameLike("%" + keyword + "%");
		List<Paper> paperList = paperMapper.selectByExample(paperExample);
		for (Paper paper : paperList) {
			Map<String, Object> map = new HashMap<>();
			map.put("paperId", paper.getPaperId());
			map.put("paperName", paper.getPaperName());
			map.put("paperCreateTime", paper.getPaperCreateTime());
			map.put("paperDuration", paper.getPaperDuration());
			map.put("paperDifficulty", paper.getPaperDifficulty());
			map.put("paperType", paper.getPaperType());
			map.put("participateNum", paper.getParticipateNum());
			ProgramingLanguage programingLanguage = programingLanguageMapper.selectByPrimaryKey(paper.getLangId());
			map.put("langName", programingLanguage.getLangName());
			map.put("langImgSrc", programingLanguage.getLangImgSrc());
			resultList.add(map);
		}
		return resultList;
	}
}
