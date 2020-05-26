package com.example.demo.constant;

/**
 * jwt 常量
 * 
 * @author: 王越
 * @date: 2019-09-11 15:00:11
 */
public class JWTConstant {
	/**
	 * 默认过期时间:2小时，单位毫秒
	 */
	public static final long EXPIRATION = 1000 * 60 * 60 * 2L;

	/**
	 * 刷新时间，半小时
	 */
	public static final long RRFRESH_TIME = 1000 * 60 * 30L;
}
