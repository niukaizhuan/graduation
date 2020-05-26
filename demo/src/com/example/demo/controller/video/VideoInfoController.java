package com.example.demo.controller.video;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.demo.entity.video.CommentInfo;
import com.example.demo.entity.video.TokenInfo;
import com.example.demo.entity.video.VideoInfo;
import com.example.demo.service.VideoInfoService;
import com.example.demo.util.StringUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/video/videoInfo")
public class VideoInfoController {
    @Autowired
    private VideoInfoService videoInfoService;


    @RequestMapping(value = "/listByVideoInfo", method = RequestMethod.POST)
    public PageInfo<VideoInfo> listByVideoInfo(@RequestBody String str) {
        JSONObject jsonObject = JSON.parseObject(str);
        VideoInfo videoInfo = new VideoInfo();
        // 过滤查询条件
        //主键
        videoInfo.setId(StringUtil.isEmpty(jsonObject.getString("id")) ? null : jsonObject.getIntValue("id"));
        //视频名称
        videoInfo.setTitle(StringUtil.isEmpty(jsonObject.getString("videoName")) ? null : jsonObject.getString("videoName"));
        //视频描述
        videoInfo.setDescription(StringUtil.isEmpty(jsonObject.getString("description")) ? null : jsonObject.getString("description"));
        //上传者
        videoInfo.setUploadUserid(StringUtil.isEmpty(jsonObject.getString("uploadUserId")) ? null : jsonObject.getIntValue("uploadUserId"));
        Integer pageNum = jsonObject.getIntValue("pageNum");
        Integer pageSize = jsonObject.getIntValue("pageSize");
        return videoInfoService.listByVideoInfo(videoInfo, pageNum, pageSize);
    }

    /**
     * 插入
     *
     * @param videoInfo
     */
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public void insert(@RequestBody VideoInfo videoInfo) {
        videoInfoService.insert(videoInfo);
    }

    @RequestMapping(value = "/insertByVideo", method = RequestMethod.POST)
    public void insertByVideo(@RequestBody String str) {
        JSONObject strj = JSON.parseObject(str);
        Integer fileInfoId = strj.getInteger("fileInfoId");
        videoInfoService.insertByVideo(fileInfoId);
    }

    @RequestMapping(value = "/addVideo", method = RequestMethod.GET)
    public void iaddByVideo( HttpSession session) {
        String path=session.getServletContext().getRealPath("/");
        System.out.println(path);
    }
    /**
     * 喜欢
     *
     * @param id
     */
    @RequestMapping(value = "/like", method = RequestMethod.POST)
    public void updateLike(@RequestBody String str) {
    	JSONObject jsonObject = JSON.parseObject(str);
    	Integer id = jsonObject.getInteger("id");
        VideoInfo videoInfo = videoInfoService.selectById(id);
        System.out.println(videoInfo);
        videoInfo.setCountLike(videoInfo.getCountLike() + 1);
        videoInfoService.update(videoInfo);
    }

    /**
     * 播放
     *
     * @param id
     */
    @RequestMapping(value = "/play", method = RequestMethod.POST)
    public void updatePlay(@RequestBody Integer id) {
        VideoInfo videoInfo = videoInfoService.selectById(id);
        videoInfo.setCountPlay(videoInfo.getCountPlay() + 1);
        videoInfoService.update(videoInfo);
    }

//    @RequestMapping ("/findId")
//    @ResponseBody
//    public Map<String, Serializable> findVideoById(Integer id) {
//        Map<String, Serializable> result = new HashMap<>();
//        VideoInfo video = videoInfoService.findVideoById(id);
//        if (video == null) {
//            result.put("status", "failure");
//            result.put("msg", "找不到该视频");
//        } else {
//            result.put("status", "success");
//            result.put("video", video);
//        }
//        return result;
//    }
//
//    @RequestMapping ("/add")
//    @ResponseBody
//    public Map<String, Serializable> addVideo(VideoInfo video, String token) {
//        Map<String, Serializable> result = new HashMap<>();
//        result.put("status", "failure");
//        try {
//            do {
//                TokenInfo tokenCheck = TokenUtil.checkToken(token, TokenUtil.TokenUssage.DEFAULT);
//                VideoUser user = userService.findUserById(tokenCheck.getUserId());
//                if (user == null) {
//                    throw new TokenUtil.TokenNotFound("用户不存在");
//                }
//                if (video.getTitle() == null) {
//                    result.put("msg", "视频标题为空");
//                    break;
//                } else if (video.getTitle().length() == 0 || video.getTitle().length() > 50) {
//                    result.put("msg", "视频标题为空或超过50长度限制");
//                    break;
//                }
//                if (video.getUrl() == null) {
//                    result.put("msg", "视频地址为空");
//                    break;
//                } else if (video.getUrl().length() == 0 || video.getUrl().length() > 100) {
//                    result.put("msg", "视频地址为空或超过100长度限制");
//                    break;
//                }
//                if (video.getPicUrl() == null) {
//                    result.put("msg", "视频封面地址为空");
//                    break;
//                } else if (video.getPicUrl().length() == 0 || video.getPicUrl().length() > 100) {
//                    result.put("msg", "视频封面地址为空或超过100长度限制");
//                    break;
//                }
//                video.setUploadUserid(user.getId());
//                video.setId(null);
//                video.setUploadTime(new Date());
//                video.setCountPlay(0);
//                video.setCountLike(0);
//                try {
//                    videoInfoService.insert(video);
//                    result.put("status", "success");
//                    video = videoInfoService.selectByURL(video.getUrl());
//                    result.put("video", video);
//                } catch (Exception e) {
//                    result.put("msg", "未知错误");
//                }
//            } while (false);
//        } catch (TokenUtil.TokenExpired | TokenUtil.TokenNotFound | TokenUtil.TokenOverAuthed | TokenUtil.TokenUssageNotMatched tokenError) {
//            result.put("msg", tokenError.getMessage());
//        }
//        return result;
//    }
//
//    @RequestMapping ("/play")
//    @ResponseBody
//    public Map<String, Serializable> playVideo(Integer id) {
//        Map<String, Serializable> result = new HashMap<>();
//        VideoInfo video = videoInfoService.findVideoById(id);
//        try {
//            video.setCountPlay(video.getCountPlay() + 1);
//            videoInfoService.update(video);
//            result.put("status", "success");
//            result.put("count_play", video.getCountPlay());
//        } catch (Exception e) {
//            result.put("status", "failure");
//            result.put("msg", "参数错误");
//        }
//        return result;
//    }
//
//    @RequestMapping ("/like")
//    @ResponseBody
//    public Map<String, Serializable> likeVideo(Integer id) {
//        Map<String, Serializable> result = new HashMap<>();
//        VideoInfo video = videoInfoService.findVideoById(id);
//        try {
//            video.setCountLike(video.getCountLike() + 1);
//            videoInfoService.update(video);
//            result.put("status", "success");
//            result.put("count_like", video.getCountLike());
//        } catch (Exception e) {
//            result.put("status", "failure");
//            result.put("msg", "参数错误");
//        }
//        return result;
//    }
//
//    @RequestMapping ("/show")
//    @ResponseBody
//    public Map<String, Serializable> showVideos(Integer offset) {
//        Map<String, Serializable> result = new HashMap<>();
//        if (offset == null) {
//            offset = 0;
//        }
//        PageHelper.startPage(offset, 12);
//        ArrayList<VideoInfo> videos = (ArrayList<VideoInfo>) videoInfoService.showVideos();
//        PageInfo<VideoInfo> pageInfo = new PageInfo<>(videos);
//        result.put("page", pageInfo);
//        return result;
//    }
//
//    @RequestMapping ("/find")
//    @ResponseBody
//    public Map<String, Serializable> findVideos(Integer offset, String q) {
//        Map<String, Serializable> result = new HashMap<>();
//        if (offset == null) {
//            offset = 0;
//        }
//        PageHelper.startPage(offset, 12);
//        ArrayList<VideoInfo> videos = (ArrayList<VideoInfo>) videoInfoService.queryVideos(q);
//        PageInfo<VideoInfo> pageInfo = new PageInfo<>(videos);
//        result.put("page", pageInfo);
//        return result;
//    }
//
//    @ResponseBody
//    @ExceptionHandler ({Exception.class})
//    public Map<String, Serializable> exceptionHandle(Exception e) {
//        Map<String, Serializable> result = new HashMap<>();
//        result.put("status", "failure");
//        result.put("msg", "参数错误");
//        Logger logger = LoggerFactory.getLogger(this.getClass());
//        logger.error(e.getMessage());
//        logger.error(e.getLocalizedMessage());
//        return result;
//    }
}
