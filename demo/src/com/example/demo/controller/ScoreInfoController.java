package com.example.demo.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.demo.entity.ScoreInfo;
import com.example.demo.service.ScoreInfoService;
import com.example.demo.util.ResponseUtil;
import com.example.demo.util.StringUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 成绩控制器类
 */
@RestController
@RequestMapping("/scoreInfo")
public class ScoreInfoController {
    @Autowired
    private ScoreInfoService scoreInfoService;

    /**
     * 插入成绩信息
     */
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insert(@RequestBody ScoreInfo scoreInfo) {
        // 调用添加数据接口
        String result = scoreInfoService.insert(scoreInfo);
        return ResponseUtil.success(result);
    }

    /**
     * 更新成绩信息
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestBody ScoreInfo scoreInfo) {
        // 更新操作
        String result = scoreInfoService.update(scoreInfo);
        return ResponseUtil.success(result);
    }

    /**
     * 逻辑删除成绩信息
     *
     * @param id 成绩标识(Integer----长度5)
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void delete(@RequestBody Integer id) {
        scoreInfoService.delete(id);
    }

    /**
     * 批量逻辑删除成绩信息
     *
     * @param id 成绩标识(Integer----长度5)
     * @return 成功删除的记录数
     */
    @RequestMapping(value = "/deleteSelection", method = RequestMethod.POST)
    public Integer deleteSelection(@RequestBody List<Integer> idList) {
        return scoreInfoService.deleteSelection(idList);
    }

    /**
     * 过滤查询
     *
     * @return 成绩信息集合
     */
    @RequestMapping(value = "/listByScoreInfo", method = RequestMethod.POST)
    public PageInfo<ScoreInfo> selectPageInfo(@RequestBody String str) {
        // 使用fastjson转为json对象
        JSONObject strj = JSON.parseObject(str);
        ScoreInfo scoreInfo = new ScoreInfo();

        // 过滤查询条件
        scoreInfo.setSchoolInfoId(StringUtil.isEmpty(strj.getString("schoolInfoId")) ? null : strj.getInteger("schoolInfoId"));
        scoreInfo.setClassInfoId(StringUtil.isEmpty(strj.getString("classInfoId")) ? null : strj.getInteger("classInfoId"));
        scoreInfo.setStudentInfoId(StringUtil.isEmpty(strj.getString("studentInfoId")) ? null : strj.getInteger("studentInfoId"));
        // 当前页码
        int pageNum = strj.getIntValue("pageNum");
        // 页面大小
        int pageSize = strj.getIntValue("pageSize");
        return scoreInfoService.listByScoreInfo(scoreInfo, pageNum, pageSize);
    }

    /**
     * 导出成绩通过学院id和班级id查找
     *
     * @param str
     */
    @RequestMapping(value = "/export", method = RequestMethod.POST)
    public void exportScoreInfo(@RequestBody String str) {
        JSONObject jsonObject = JSON.parseObject(str);
        ScoreInfo scoreInfo = new ScoreInfo();
        scoreInfo.setSchoolInfoId(StringUtil.isEmpty(jsonObject.getString("schoolInfoId")) ? null : jsonObject.getInteger("schoolInfoId"));
        scoreInfo.setClassInfoId(StringUtil.isEmpty(jsonObject.getString("classInfoId")) ? null : jsonObject.getInteger("classInfoId"));
        scoreInfoService.exportScoreInfo(scoreInfo);
    }

    /**
     * 导入Excel成绩
     */
    @RequestMapping(value = "/importExcelXLSXScore", method = RequestMethod.POST)
    public void importExcelXLSXScore(@RequestBody String str){
        JSONObject strj = JSON.parseObject(str);
        Integer fileInfoId = strj.getInteger("fileInfoId");
        scoreInfoService.importExcelXLSXScore(fileInfoId);
    }
}
