package com.example.demo.controller.sys;

import com.example.demo.util.sys.websocket.WebSocketServer;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.concurrent.CopyOnWriteArraySet;

/**
 * WebSocket通讯控制器
 * 
 * @author admin
 *
 */
@Controller
public class WebSocketController {

	/**
	 * 请求webSocket
	 * 
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/pushMsgToHtml", method = RequestMethod.GET)
	@ResponseBody
	public String pushMsgToHtml() throws IOException {
		CopyOnWriteArraySet<WebSocketServer> webSocketSet = WebSocketServer.webSocketSet;
		for (WebSocketServer webSocketServer : webSocketSet) {
			webSocketServer.sendMessage("你好客户端.....我是服务端");
		}

		return "200";
	}

}
