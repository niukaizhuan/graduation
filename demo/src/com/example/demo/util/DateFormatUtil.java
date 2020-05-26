package com.example.demo.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 时间日期工具转换类
 * 
 * @author: 王越
 * @date: 2019年5月23日 下午4:13:17
 */
public class DateFormatUtil {

	/**
	 * 格式：yyyy-MM-dd
	 */
	private static final SimpleDateFormat formatDay = new SimpleDateFormat("yyyy-MM-dd");

	/**
	 * 格式：yyyy-MM-dd HH:mm:ss
	 */
	private static final SimpleDateFormat formatSecond = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	/**
	 * 格式：yyyy年MM月dd日
	 */
	private static final SimpleDateFormat formatChinese = new SimpleDateFormat("yyyy年MM月dd日");

	/**
	 * 格式：yyyyMMddHHmmss(多用于文件编码)
	 */
	private static final SimpleDateFormat formatCode = new SimpleDateFormat("yyyyMMddHHmmss");

	/**
	 * 格式：yyyy-MM-dd'T'HH:mm:ss.SSS'Z'
	 */
	private static final SimpleDateFormat formatUTC = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");

	/**
	 * 返回当前Timestamp时间
	 * 
	 * @return yyyy-MM-dd HH-mm-ss[..]格式的Timestamp类型
	 */
	public static Timestamp getTimestamp() {
//		 return new Timestamp(new Date().getTime());
		return new Timestamp(System.currentTimeMillis());
	}

	/**
	 * 将iview的日期控件，带时分秒的UTC日期转成Timestamp
	 * 
	 * @param time yyyy-MM-dd HH-mm-ss格式的字符串
	 * @return yyyy-MM-dd HH-mm-ss[..]格式的Timestamp类型
	 */
	public static Timestamp parseTimestampByUTC(String time) {
		return Timestamp.valueOf(DateFormatUtil.formatSecond(DateFormatUtil.parseDateByUTC(time)));
	}

	/**
	 * 获取当前Date类型时间
	 * 
	 * @return 当前Date类型时间
	 */
	public static Date getDate() {
		return new Date();
	}

	/**
	 * UTC时间转换成北京时间 iView的DatePicker控件时间为UTC时间，比北京时间少8小时
	 * 
	 * @param time iView的DatePicker控件UTC时间
	 * @return 北京时间的Date类型
	 */
	public static Date parseDateByUTC(String time) {
		Date date = null;
		try {
			date = formatUTC.parse(time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// 使用默认时区和语言环境获得一个日历
		Calendar calendar = Calendar.getInstance();
		// 使用给定的 Date 设置此 Calendar 的时间
		calendar.setTime(date);
		// void set(int field, int value) 将给定的日历字段设置为给定值
		// int get(int field)返回给定日历字段的值
		// 北京时间比格林尼治时间（世界时）早8小时，即：北京时间=世界时+8小时。
		calendar.set(Calendar.HOUR, calendar.get(Calendar.HOUR) + 8);
		// calendar.getTime() 返回的是Date类型，也可以使用calendar.getTimeInMillis()获取时间戳
		return calendar.getTime();
	}

	/**
	 * 字符串转换为Date类型 yyyy-MM-dd
	 * 
	 * @param time yyyy-MM-dd格式的字符串
	 * @return yyyy-MM-dd格式的Date类型
	 */
	public static Date parseDay(String time) {
		try {
			return formatDay.parse(time);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 字符串转换为Date类型 yyyy-MM-dd
	 * 
	 * @param time yyyy-MM-dd HH-mm-ss格式的字符串
	 * @return yyyy-MM-dd的Date类型
	 * @throws ParseException 解析异常
	 */
	public static Date parseDayBySecond(String time) throws ParseException {
		// 注意java.sql.Date.valueOf()函数只能接受参数类型为yyyy-MM-dd类型的字符串
		return java.sql.Date.valueOf(formatDay.format(formatDay.parse(time)));
	}

	/**
	 * Date类型数据转换为字符串yyyy-MM-dd
	 * 
	 * @param date Date类型的日期
	 * @return yyyy-MM-dd的字符串
	 */
	public static String formatDay(Date date) {
		return formatDay.format(date);
	}

	/**
	 * Date类型数据转换为字符串yyyy-MM-dd HH:mm:ss
	 * 
	 * @param date Date类型数据
	 * @return yyyy-MM-dd HH:mm:ss的字符串
	 */
	public static String formatSecond(Date date) {
		return formatSecond.format(date);
	}

	/**
	 * Date类型数据转换为字符串yyyy年MM月dd日
	 * 
	 * @param date Date类型数据
	 * @return yyyy年MM月dd日的字符串
	 */
	public static String formatChinese(Date date) {
		return formatChinese.format(date);
	}

	/**
	 * Date类型数据转换为字符串yyyyMMddHHmmss
	 * 
	 * @param date Date类型数据
	 * @return yyyyMMddHHmmss的字符串
	 */
	public static String formatCode(Date date) {
		return formatCode.format(date);
	}

}
