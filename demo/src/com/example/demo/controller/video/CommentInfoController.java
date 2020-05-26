package com.example.demo.controller.video;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.demo.entity.video.CommentInfo;
import com.example.demo.service.CommentInfoService;
import com.example.demo.service.VideoInfoService;
import com.example.demo.util.StringUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.xml.internal.ws.message.StringHeader;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/video/commentInfo")
public class CommentInfoController {
    @Autowired
    private CommentInfoService commentInfoService;
    @Autowired
    private VideoInfoService videoInfoService;

    /**
     * 查询
     *
     * @param str
     * @return
     */
    @RequestMapping(value = "/listByCommentInfo", method = RequestMethod.POST)
    public PageInfo<CommentInfo> listByCommentInfo(@RequestBody String str) {
        JSONObject jsonObject = JSON.parseObject(str);
        CommentInfo commentInfo = new CommentInfo();
        // 过滤查询条件
        commentInfo.setVideoId(StringUtil.isEmpty(jsonObject.getString("videoId")) ? null : jsonObject.getIntValue("videoId"));
        Integer pageNum = jsonObject.getIntValue("pageNum");
        Integer pageSize = jsonObject.getIntValue("pageSize");
        return commentInfoService.listByCommentInfo(commentInfo, pageNum, pageSize);
    }

    /**
     * 插入
     *
     * @param commentInfo
     */
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public void insert(@RequestBody CommentInfo commentInfo) {
        commentInfoService.insert(commentInfo);
    }

    /**
     * 逻辑删除
     *
     * @param id
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void delete(@RequestBody String str) {
    	JSONObject jsonObject = JSON.parseObject(str);
    	Integer id = jsonObject.getInteger("id");
        commentInfoService.delete(id);
    }

    /**
     * 修改
     *
     * @param id
     */
    @RequestMapping(value = "/like", method = RequestMethod.POST)
    public void updateLike(@RequestBody String str) {
    	JSONObject jsonObject = JSON.parseObject(str);
    	Integer id = jsonObject.getInteger("id");
        CommentInfo commentInfo = commentInfoService.selectById(id);
        commentInfo.setCountLike(commentInfo.getCountLike() + 1);
        commentInfoService.update(commentInfo);

    }


    @RequestMapping ("/findId")
    @ResponseBody
    public Map<String, Serializable> showComments(@RequestParam ("id") Integer videoId, Integer offset) {
        Map<String, Serializable> result = new HashMap<>();
        if (offset == null) {
            offset = 0;
        }
        PageHelper.startPage(offset, 10);
        ArrayList<CommentInfo> comments = (ArrayList<CommentInfo>) commentInfoService.showComments(videoId);
        PageInfo<CommentInfo> pageInfo = new PageInfo<>(comments);
        result.put("page", pageInfo);
        return result;
    }

   
}
