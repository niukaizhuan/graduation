package com.example.demo.controller.video;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.demo.entity.video.BarrageInfo;
import com.example.demo.service.BarrageInfoService;
import com.example.demo.util.StringUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/video/barrageInfo")
public class BarrageInfoController {

    @Autowired
    private BarrageInfoService barrageInfoService;

    /**
     * 插入
     *
     * @param barrageInfo
     * @param userId
     * @return
     */
    @RequestMapping("/insert")
    public void insert(@RequestBody String str) {
      JSONObject jsonObject = JSON.parseObject(str);
      BarrageInfo barrage = new BarrageInfo();
      String name = jsonObject.getString("userName");
      barrage.setVideoId(jsonObject.getIntValue("videoId"));
      barrage.setContent(jsonObject.getString("content"));
      barrage.setColor(jsonObject.getString("color"));
      barrage.setOfftime(jsonObject.getIntValue("offtime"));
      String position = jsonObject.getString("position");
      if(position.equals("固定")){
          barrage.setPosition("0");
      } else {
          barrage.setPosition("2");
      }
        barrageInfoService.insert(barrage,name);
    }

    /**
     * 查询
     *
     * @param str
     * @return
     */
    @RequestMapping(value = "/listByBarrageInfo", method = RequestMethod.POST)
    public PageInfo<BarrageInfo> listByBarrageInfo(@RequestBody String str) {
        JSONObject jsonObject = JSON.parseObject(str);
        BarrageInfo barrageInfo = new BarrageInfo();
        // 过滤查询条件
        barrageInfo.setVideoId(StringUtil.isEmpty(jsonObject.getString("videoId")) ? null : jsonObject.getIntValue("videoId"));

        // 当前页索引
        Integer pageNum = jsonObject.getIntValue("pageNum");
        // 当前页页面大小
        Integer pageSize = jsonObject.getIntValue("pageSize");
        return barrageInfoService.listByBarrageInfo(barrageInfo, pageNum, pageSize);

    }


//    @RequestMapping ("/findId")
//    public Map<String, Serializable> showBarrages(@RequestParam ("id") Integer videoId) {
//        Map<String, Serializable> result = new HashMap<>();
//        ArrayList<BarrageInfo> barrages = (ArrayList<BarrageInfo>) barrageService.showBarrages(videoId);
//        result.put("barrages", barrages);
//        return result;
//    }
//
//    @RequestMapping ("/add")
//    public Map<String, Serializable> addBarrage(@RequestBody String str) {
//        Map<String, Serializable> result = new HashMap<>();
//        JSONObject jsonObject = JSON.parseObject(str);
//        BarrageInfo barrage = new BarrageInfo();
//        String token = jsonObject.getString("token");
//        barrage.setVideoId(jsonObject.getIntValue("videoId"));
//        barrage.setContent(jsonObject.getString("content"));
//        barrage.setColor(jsonObject.getString("color"));
//        barrage.setOfftime(jsonObject.getIntValue("offtime"));
//        String position = jsonObject.getString("position");
//        if(position.equals("固定")){
//            barrage.setPosition("0");
//        } else {
//            barrage.setPosition("2");
//        }
//        result.put("status", "failure");
//        try {
//            do {
//                TokenInfo tokenCheck = TokenUtil.checkToken(token, TokenUtil.TokenUssage.DEFAULT);
//                VideoUser user = userService.findUserById(tokenCheck.getUserId());
//                if (user == null) {
//                    throw new TokenUtil.TokenNotFound("用户不存在");
//                }
//                if (barrage.getVideoId() == null) {
//                    result.put("msg", "视频 id 为空");
//                    break;
//                } else {
//                    VideoInfo video = videoService.findVideoById(barrage.getVideoId());
//                    if (video == null) {
//                        result.put("msg", "视频 id 不正确");
//                        break;
//                    }
//                }
//                if (barrage.getContent() == null) {
//                    result.put("msg", "弹幕内容为空");
//                    break;
//                } else if (barrage.getContent().length() == 0 || barrage.getContent().length() > 250) {
//                    result.put("msg", "弹幕内容为空或超过250长度限制");
//                    break;
//                }
//                if (barrage.getColor() == null || barrage.getColor().length() == 0 || barrage.getColor().length() > 10) {
//                    barrage.setColor("#ffffff");
//                    break;
//                }
//                if (barrage.getOfftime() == null || barrage.getOfftime() < 0) {
//                    barrage.setOfftime(0);
//                    break;
//                }
//                if (barrage.getPosition() == null) {
//                    barrage.setPosition("0");
//                    break;
//                }
//                barrage.setUserId(user.getId());
//                barrage.setId(null);
//                barrage.setSendTime(new Date());
//                try {
//                    barrageService.insert(barrage);
//                    result.put("status", "success");
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
