package com.example.demo.config;

import java.util.Properties;

import com.example.demo.util.PropertiesUtil;
import org.springframework.context.annotation.Configuration;

/**
 * 文件上传配置类
 * 
 * @author: 王越
 * @date: 2019-06-28 14:14:01
 */
@Configuration
public class FileConfig {

	/**
	 * 文件上传地址
	 */
	public static String UPLOAD_PATH;

	/**
	 * 虚拟目录
	 */
	public static String VIRTUAL_PATH;

	/**
	 * 资源文件路径
	 */
	private static String FILE_PROPERTIES = "resource/file.properties";

	public FileConfig() {
		Properties prop = PropertiesUtil.getProperties(FILE_PROPERTIES);
		FileConfig.UPLOAD_PATH = prop.getProperty("UPLOAD_PATH");
		FileConfig.VIRTUAL_PATH = prop.getProperty("VIRTUAL_PATH");
	}

}
