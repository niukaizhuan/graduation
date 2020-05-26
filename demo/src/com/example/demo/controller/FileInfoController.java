package com.example.demo.controller;

import com.example.demo.entity.FileInfo;
import com.example.demo.service.FileInfoSerivce;
import com.example.demo.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * 文件控制类
 */
@RestController
@RequestMapping("/config/fileInfo")
public class FileInfoController {

	@Autowired
	private FileInfoSerivce filesSerivce;

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public List<Integer> upload(@RequestParam(value = "fileList", required = true) MultipartFile[] fileList,
			@RequestParam(value = "fileType", required = true) String fileType) {
		if (fileList.length == 0) {
			return null;
		}
//		String fileType2 = "P";
		// 上传文件列表
		List<FileInfo> fileInfoList = FileUtil.uploadFileList(fileList, fileType);
		// 文件实体类对象id集合
		List<Integer> idList = new ArrayList<Integer>();
		// 向数据库添加数据
		filesSerivce.insertFileInfoList(fileInfoList);
		// 获取文件数据的id集合，id自动添加到记录上
		for (FileInfo file : fileInfoList) {
			idList.add(file.getId());
		}
		return idList;
	}

	public static void uploadFile(File file, String uploadPath) {
//		File file = new File("D://Java//IntelliJIDEA//workspace//J2SE//IO//file//fileBuffered//bufferedStream.txt");// 文件对象

//		String path = "D://Java//IntelliJIDEA//workspace//J2SE//IO//file//fileBuffered//copy//bufferedStream.txt";// 目标路径

		FileInputStream in = null;// 字节型输入流

		FileOutputStream out = null;// 字节型输出流

		BufferedInputStream bin = null;// 缓冲输入流

		BufferedOutputStream bout = null;// 缓冲输出流
		try {
			in = new FileInputStream(file);
			bin = new BufferedInputStream(in);// 高级流需要低级流作为参数

			out = new FileOutputStream(uploadPath);
			bout = new BufferedOutputStream(out);// 高级流需要低级流作为参数,没有第二个参数

			byte[] b = new byte[1024];// 小推车
			int count = bin.read(b);// 读取的字节数
			while (count != -1) {
				System.out.println(new String(b, 0, count));
				bout.write(b, 0, count);// 写,需要设置读取的长度
				bout.flush();// 刷新
				count = bin.read(b);
			}
//			String string = "一二三四五六七八九十";
//			bout.write(string.getBytes());// 参数为字节数组
			bout.flush();// 刷新
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭流
		}
	}

}
