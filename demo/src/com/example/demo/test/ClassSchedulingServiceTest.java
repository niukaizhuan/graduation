package com.example.demo.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.example.demo.entity.ClassTask;
import com.example.demo.service.ClassSchedulingService;

public class ClassSchedulingServiceTest  extends BaseTest{
	@Autowired
	ClassSchedulingService classSchedulingService;
	
	@Test
	public void listMenuByUserId() {
		System.out.println("--------------------------------");
		ClassTask classTask = new ClassTask();
		classTask.setTermName("2019-2020-2");
		classSchedulingService.classScheduling(classTask);
		System.out.println("成功了！");
	}

}
