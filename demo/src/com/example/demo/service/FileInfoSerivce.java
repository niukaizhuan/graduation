package com.example.demo.service;

import com.example.demo.entity.FileInfo;

import java.util.List;

public interface FileInfoSerivce {
	/**
	 * 插入
	 * 
	 * @param record
	 * @return 主键
	 */
	void insert(FileInfo record);

	/**
	 * 批量插入
	 * 
	 * @param list 文件集合
	 * @return 成功插入的条数
	 */
	Integer insertFileInfoList(List<FileInfo> list);


}
