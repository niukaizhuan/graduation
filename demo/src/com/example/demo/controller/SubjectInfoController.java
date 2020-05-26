package com.example.demo.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.demo.entity.GradeInfo;
import com.example.demo.entity.SubjectInfo;
import com.example.demo.service.SubjectInfoService;
import com.example.demo.util.PoiUtil;
import com.example.demo.util.ResponseUtil;
import com.example.demo.util.StringUtil;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 题库信息控制器类
 */
@Slf4j
@RestController
@RequestMapping("/subjectInfo")
public class SubjectInfoController {
    @Autowired
    private SubjectInfoService subjectInfoService;

    /**
     * 通过课程id查询题目
     * 
     * @param str
     * @return
     */
    @RequestMapping(value = "/listByCourseId",method = RequestMethod.POST)
    public List<SubjectInfo> listByCourseId(@RequestBody String str){
        JSONObject jsonObject = JSON.parseObject(str);
        return subjectInfoService.listByCourseId(jsonObject.getIntValue("courseId"),jsonObject.getIntValue("subjectCount"));
    }
    /**
     * 查询年级信息和id集合
     *
     * @return 年级信息和id集合
     */
    @RequestMapping(value = "/listGradeInfo", method = RequestMethod.GET)
    public List<GradeInfo> listGradeInfo() {
        return subjectInfoService.listGradeInfo();
    }
    /**
     * 查询题库信息和id集合
     *
     * @return 题库信息和id集合
     */
    @RequestMapping(value = "/listSubjectInfo", method = RequestMethod.GET)
    public List<SubjectInfo> listSubjectInfo() {
        return subjectInfoService.listSubjectInfo();
    }

    /**
     * 插入题库信息
     *
     */
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insert(@RequestBody SubjectInfo subjectInfo) {
        // 调用添加数据接口
        String result = subjectInfoService.insert(subjectInfo);
        return ResponseUtil.success(result);
    }

    /**
     * 更新题库信息
     *
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestBody SubjectInfo subjectInfo) {
        // 更新操作
        String result = subjectInfoService.update(subjectInfo);
        return ResponseUtil.success(result);
    }

    /**
     * 逻辑删除题库信息
     *
     * @param id 题库标识(Integer----长度5)
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void delete(@RequestBody Integer id) {
        subjectInfoService.delete(id);
    }

    /**
     * 批量逻辑删除题库信息
     *
     * @param id 题库标识(Integer----长度5)
     * @return 成功删除的记录数
     */
    @RequestMapping(value = "/deleteSelection", method = RequestMethod.POST)
    public Integer deleteSelection(@RequestBody List<Integer> idList) {
        return subjectInfoService.deleteSelection(idList);
    }

    /**
     * 过滤查询
     *
     * @return 题库信息集合
     */
    @RequestMapping(value = "/selectPageInfo", method = RequestMethod.POST)
    public PageInfo<SubjectInfo> selectPageInfo(@RequestBody String str, Integer userId) {
        log.error("从token中获取的userId:" + userId);
        // 使用fastjson转为json对象
        JSONObject strj = JSON.parseObject(str);
        SubjectInfo subjectInfo = new SubjectInfo();

        // 过滤查询条件
        String subjectName = strj.getString("subjectName");
//        Integer courseInfoId = strj.getInteger("courseId");
//        Integer gradeInfoId= strj.getInteger("gradeId");
        subjectInfo.setSubjectName(StringUtil.isEmpty(subjectName)?null:subjectName);
        subjectInfo.setCourseId(StringUtil.isEmpty(strj.getString("courseId"))?null:strj.getIntValue("courseId"));
        subjectInfo.setClassInfoId(StringUtil.isEmpty(strj.getString("gradeId"))?null:strj.getIntValue("gradeId"));
        // 当前页码
        int pageNum = strj.getIntValue("pageNum");
        // 页面大小
        int pageSize = strj.getIntValue("pageSize");
        return subjectInfoService.listBySubjectInfo(subjectInfo, pageNum, pageSize);
    }

    /**
     * 导入Excel
     */
    @RequestMapping(value = "/insertByExcel", method = RequestMethod.POST)
    public void insertByExcel(@RequestBody String str) {
        JSONObject strj = JSON.parseObject(str);
        Integer fileInfoId = strj.getInteger("fileInfoId");
        subjectInfoService.insertByExcel(fileInfoId);
    }

    /**
     * 导出excel
     */
    @RequestMapping("/export")
    public void export() throws Exception {
        List<SubjectInfo> subjectInfoList = subjectInfoService.selectAll();
        PoiUtil.exportXLSX(subjectInfoList);
        for (SubjectInfo subjectInfo:subjectInfoList){
            System.out.println(subjectInfo);
        }
    }
    /**
     * 测试导入
     */
    @RequestMapping("/test1")
    public void insert() throws Exception {
//        List<SubjectInfo> subjectInfoList = PoiUtil.importExcelXLSX();
//        System.out.println(subjectInfoList);
//        int num = subjectInfoService.insertData(subjectInfoList);
//        if(num>0){
//            System.out.println("插入数据成功！");
//        }
    }

}
