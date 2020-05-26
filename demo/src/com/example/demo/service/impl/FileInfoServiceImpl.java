package com.example.demo.service.impl;

import com.example.demo.entity.FileInfo;
import com.example.demo.mapper.FileInfoMapper;
import com.example.demo.service.FileInfoSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FileInfoServiceImpl implements FileInfoSerivce {

	@Autowired
	private FileInfoMapper fileInfoMapper;

	@Override
	public void insert(FileInfo record) {
		fileInfoMapper.insert(record);
	}

	@Override
	public Integer insertFileInfoList(List<FileInfo> list) {
		return fileInfoMapper.insertFileInfoList(list);
	}

}
