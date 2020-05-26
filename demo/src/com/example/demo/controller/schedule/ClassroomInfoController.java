package com.example.demo.controller.schedule;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.demo.entity.ClassroomInfo;
import com.example.demo.service.ClassroomInfoService;
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
 * 教室控制器
 */
@RestController
@RequestMapping("/schedule/classroomInfo")
public class ClassroomInfoController {
    @Autowired
    private ClassroomInfoService classroomInfoService;

    /**
     * 查询教室信息id集合
     *
     * @return
     */
    @RequestMapping(value = "/listClassroomInfo", method = RequestMethod.GET)
    public List<ClassroomInfo> listClassroomInfo() {
        return classroomInfoService.listClassroomInfo();
    }

    /**
     * 插入教室信息
     *
     * @param classroomInfo
     * @return
     */
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insert(@RequestBody ClassroomInfo classroomInfo) {
        // 调用添加数据接口
        String result = classroomInfoService.insert(classroomInfo);
        return ResponseUtil.success(result);
    }

    /**
     * 更新教室
     *
     * @param classroomInfo
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestBody ClassroomInfo classroomInfo) {
        // 更新操作
        String result = classroomInfoService.update(classroomInfo);
        return ResponseUtil.success(result);
    }

    /**
     * 逻辑删除教室信息
     *
     * @param id 成绩标识(Integer----长度5)
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void delete(@RequestBody Integer id) {
        classroomInfoService.delete(id);
    }

    /**
     * 批量逻辑删除教室信息
     *
     * @param idList 成绩标识(Integer----长度5)
     * @return 成功删除的记录数
     */
    @RequestMapping(value = "/deleteSelection", method = RequestMethod.POST)
    public Integer deleteSelection(@RequestBody List<Integer> idList) {
        return classroomInfoService.deleteSelection(idList);
    }

    /**
     * 过滤查询
     *
     * @return
     */
    @RequestMapping(value = "/listByClassroomInfo", method = RequestMethod.POST)
    public PageInfo<ClassroomInfo> listByClassroomInfo(@RequestBody String str) {
        // 使用fastjson转为json对象
        JSONObject strj = JSON.parseObject(str);
        ClassroomInfo classroomInfo = new ClassroomInfo();
        // 过滤查询条件
        classroomInfo.setClassroomNumber(StringUtil.isEmpty(strj.getString("classroomNumber")) ? null : strj.getString("classroomNumber"));
        classroomInfo.setTeachBuildNumber(StringUtil.isEmpty(strj.getString("teachBuildNumber")) ? null : strj.getString("teachBuildNumber"));
        // 当前页码
        int pageNum = strj.getIntValue("pageNum");
        // 页面大小
        int pageSize = strj.getIntValue("pageSize");
        return classroomInfoService.listByClassroomInfo(classroomInfo, pageNum, pageSize);
    }

}
