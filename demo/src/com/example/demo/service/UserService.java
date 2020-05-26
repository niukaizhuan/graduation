package com.example.demo.service;

import java.util.Map;

import com.example.demo.entity.User;

public interface UserService {

	/**
	 * 账号登录
	 * 
	 * @return
	 */
	Map<String, Object> accountLogin(String username, String password);

	/**
	 * 通过用户名查询用户
	 * 
	 * @param userName 用户名
	 * @return 用户
	 */
	User selectByUserName(String userName);

	/**
	 * 通过手机号查询用户
	 * 
	 * @param phone 手机号
	 * @return 用户
	 */
	User selectByPhone(String phone);

	/**
	 * 通过邮箱查询用户
	 * 
	 * @param email 邮箱
	 * @return 用户
	 */
	User selectByEmail(String email);

	/**
	 * 添加用户
	 * 
	 * @param user String
	 * @return success/fail
	 */
	String insert(User user);

	/**
	 * 更新用户信息
	 * 
	 * @param user String
	 * @return success/fail
	 */
	String updateById(User user);

}
