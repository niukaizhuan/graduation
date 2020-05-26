package com.example.demo.view;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("video")
public class VideoView {

	@RequestMapping("/video")
    public String videoInfo(){
       return "video/videoTest";
    }
}
