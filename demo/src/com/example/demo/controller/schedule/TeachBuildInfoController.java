package com.example.demo.controller.schedule;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.demo.entity.TeachBuildInfo;
import com.example.demo.service.TeachBuildInfoService;
import com.example.demo.util.ResponseUtil;
import com.example.demo.util.StringUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 教学楼信息控制器
 */
@RestController
@RequestMapping("/schedule/teachBuildInfo")
public class TeachBuildInfoController {
    @Autowired
    private TeachBuildInfoService teachBuildInfoService;

    /**
     * 查询教学楼信息id集合
     *
     * @return
     */
    @RequestMapping(value = "/listTeachBuildInfo", method = RequestMethod.GET)
    public List<TeachBuildInfo> listTeachBuildInfo() {
        return teachBuildInfoService.listTeachBuildInfo();
    }

    /**
     * 插入教学楼信息
     *
     * @param teachBuildInfo
     * @return
     */
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insert(@RequestBody TeachBuildInfo teachBuildInfo) {
        // 调用添加数据接口
        String result = teachBuildInfoService.insert(teachBuildInfo);
        return ResponseUtil.success(result);
    }

    /**
     * 更新教学楼
     *
     * @param teachBuildInfo
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestBody TeachBuildInfo teachBuildInfo) {
        // 更新操作
        String result = teachBuildInfoService.update(teachBuildInfo);
        return ResponseUtil.success(result);
    }

    /**
     * 逻辑删除教学楼信息
     *
     * @param id 成绩标识(Integer----长度5)
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void delete(@RequestBody Integer id) {
        teachBuildInfoService.delete(id);
    }

    /**
     * 批量逻辑删除教学楼信息
     *
     * @param id 成绩标识(Integer----长度5)
     * @return 成功删除的记录数
     */
    @RequestMapping(value = "/deleteSelection", method = RequestMethod.POST)
    public Integer deleteSelection(@RequestBody List<Integer> idList) {
        return teachBuildInfoService.deleteSelection(idList);
    }

    /**
     * 过滤查询
     *
     * @return
     */
    @RequestMapping(value = "/listByTeachBuildInfo", method = RequestMethod.POST)
    public PageInfo<TeachBuildInfo> listByTeachBuildInfo(@RequestBody String str) {
        // 使用fastjson转为json对象
        JSONObject strj = JSON.parseObject(str);
        TeachBuildInfo teachBuildInfo = new TeachBuildInfo();
        // 过滤查询条件
        teachBuildInfo.setTeachBuildName(StringUtil.isEmpty(strj.getString("teachBuildName")) ? null : strj.getString("teachBuildName"));
        teachBuildInfo.setTeachBuildNumber(StringUtil.isEmpty(strj.getString("teachBuildNumber")) ? null : strj.getString("teachBuildNumber"));
        // 当前页码
        int pageNum = strj.getIntValue("pageNum");
        // 页面大小
        int pageSize = strj.getIntValue("pageSize");
        return teachBuildInfoService.listByTeachBuildInfo(teachBuildInfo, pageNum, pageSize);
    }

}
