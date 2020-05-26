package com.example.demo.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.example.demo.mapper.UserMapper;

public class UserMapperTest extends BaseTest {
	@Autowired
	UserMapper userMapper;
	
	@Test
	public void listMenuByUserId() {
		System.out.println("--------------------------------");
		Integer n = userMapper.selectUserId("jit_nkz");
		System.out.println("--------------------------------");
		System.out.println("用户id"+n);
	}
}
