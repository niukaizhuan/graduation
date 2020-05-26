package com.example.demo.test;

import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * junit测试基础类<br>
 * 其他mapper/service测试类继承本类
 * 
 * @author: dylan
 * @date: 2019年5月8日 上午9:59:42
 */
@RunWith(SpringJUnit4ClassRunner.class) // 需要junit、spring-test
//@WebAppConfiguration("config/")//指定配置文件加载目录
@ContextConfiguration("classpath:applicationContext.xml") // 获取配置文件
//@ContextConfiguration(locations={"classpath:Spring-config.xml","classpath:Spring-servlet.xml"}) // 获取多个配置文件
public abstract class BaseTest {

	protected Logger logger = LoggerFactory.getLogger(getClass());

}
