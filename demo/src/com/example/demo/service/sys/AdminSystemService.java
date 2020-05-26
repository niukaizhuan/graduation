package com.example.demo.service.sys;

import com.example.demo.entity.sys.Admin;

import java.util.List;

public interface AdminSystemService {
	/**
	 * 校验管理员登录
	 * 
	 * @param ano
	 * @param psw
	 * @return
	 */
	public List<Admin> adminLogin(String ano, String psw);

	/**
	 * 更新管理员信息
	 * 
	 * @param admin
	 * @return
	 */
	public boolean updateAdmin(Admin admin);
}
