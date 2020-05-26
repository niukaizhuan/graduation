package com.example.demo.controller.schedule;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.demo.entity.SchoolTeachBuildInfo;
import com.example.demo.service.SchoolTeachBuildInfoService;
import com.example.demo.util.StringUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 学院教学区安排
 */
@RestController
@RequestMapping("/schedule/schoolTeachBuildInfo")
public class SchoolTeachBuildInfoController {
    @Autowired
    private SchoolTeachBuildInfoService schoolTeachBuildInfoService;


    /**
     * 插入学院教学区安排
     *
     * @param schoolTeachBuildInfo
     */
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public void insert(@RequestBody SchoolTeachBuildInfo schoolTeachBuildInfo) {
        schoolTeachBuildInfoService.insert(schoolTeachBuildInfo);
    }

    /**
     * 更新
     *
     * @param schoolTeachBuildInfo
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void update(@RequestBody SchoolTeachBuildInfo schoolTeachBuildInfo) {
        schoolTeachBuildInfoService.update(schoolTeachBuildInfo);
    }

    /**
     * 逻辑删除教室信息
     *
     * @param id 成绩标识(Integer----长度5)
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void delete(@RequestBody Integer id) {
        schoolTeachBuildInfoService.delete(id);
    }

    /**
     * 批量逻辑删除教室信息
     *
     * @param id 成绩标识(Integer----长度5)
     * @return 成功删除的记录数
     */
    @RequestMapping(value = "/deleteSelection", method = RequestMethod.POST)
    public Integer deleteSelection(@RequestBody List<Integer> idList) {
        return schoolTeachBuildInfoService.deleteSelection(idList);
    }

    /**
     * 过滤查询
     *
     * @return
     */
    @RequestMapping(value = "/listBySchoolTeachBuildInfo", method = RequestMethod.POST)
    public PageInfo<SchoolTeachBuildInfo> listBySchoolTeachBuildInfo(@RequestBody String str) {
        // 使用fastjson转为json对象
        JSONObject strj = JSON.parseObject(str);
        SchoolTeachBuildInfo schoolTeachBuildInfo = new SchoolTeachBuildInfo();
        // 过滤查询条件
        schoolTeachBuildInfo.setSchoolNo(StringUtil.isEmpty(strj.getString("schoolNo")) ? null : strj.getString("schoolNo"));
        schoolTeachBuildInfo.setTeachBuildNo(StringUtil.isEmpty(strj.getString("teachBuildNo")) ? null : strj.getString("teachBuildNo"));
        // 当前页码
        int pageNum = strj.getIntValue("pageNum");
        // 页面大小
        int pageSize = strj.getIntValue("pageSize");
        return schoolTeachBuildInfoService.listBySchoolTeachBuildInfo(schoolTeachBuildInfo, pageNum, pageSize);
    }
}
