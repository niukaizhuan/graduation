package com.example.demo.mapper;

import com.example.demo.entity.FileInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FileInfoMapper {
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

	/**
	 * 根据id更新状态
	 * 
	 * @param id
	 * @param state 需要设置的状态
	 */
	void updateStateById(@Param("id") Integer id, @Param("state") String state);

	/**
	 * 根据id集合更新状态
	 * 
	 * @param idList
	 * @param state  需要设置的状态
	 * @return 更新的条数
	 */
	Integer updateStateByIdList(@Param("idList") List<Integer> idList, @Param("state") String state);

	FileInfo selectById(Integer id);

}