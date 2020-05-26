package com.example.demo.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.example.demo.entity.Menu;
import com.example.demo.entity.User;
import com.example.demo.entity.query.JWTQuery;
import com.example.demo.entity.vo.MenuVo;
import com.example.demo.mapper.MenuMapper;
import com.example.demo.mapper.UserMapper;
import com.example.demo.service.UserService;
import com.example.demo.util.AES128Util;
import com.example.demo.util.JWTUtil;
import com.example.demo.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Autowired
	private MenuMapper menuMapper;

	@Override
	public Map<String, Object> accountLogin(String username, String password) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 将密码加密
		String encryptPassword = AES128Util.encrypt(password, username);
		System.out.println("加密后密码："+encryptPassword);
		// 通过用户名找到对应用户
		User user = userMapper.selectByUserName(username);
		System.out.println("加密后密码："+encryptPassword);
		System.out.println(user.getPassword());
		if (user == null || !user.getPassword().equals(encryptPassword)) {
			// 用户名不存在 或 密码错误
			map.put("info", "fail");
			return map;
		}
		// 不保存密码
		user.setPassword(null);

		// 获取菜单集合
		List<Menu> menuList = menuMapper.listMenuByUserId(user.getId());
		System.out.println("获取菜单集合"+menuList);
		// 返给客户端的菜单集合
		List<MenuVo> menuVoList = getMenuVoList(menuList);
		System.out.println("返给客户端的菜单集合"+menuVoList);

		// 子菜单名称集合，即当前用户的权限
		List<String> menuNameList = getMenuNameList(menuList);
		System.out.println("当前用户的权限:"+menuNameList);
		// 设置用户session
		setUserSession(user, menuNameList);

		// 创建token
		JWTQuery query = new JWTQuery(user, "admin", menuNameList, 1000 * 60 * 60 * 24L);
		String token = JWTUtil.createToken(query);

		map.put("info", "success");
		map.put("userId", user.getId());
		map.put("userName", user.getUserName());
		map.put("password", password);
		map.put("token", token);
		map.put("menuVoList", menuVoList);

		System.out.println("map" +map);
		return map;
	}

	/**
	 * 获取返回去客户端的菜单集合
	 * 
	 * @param menuList 原始菜单集合
	 * @return 菜单集合
	 */
	private List<MenuVo> getMenuVoList(List<Menu> menuList) {
		// 返给客户端的菜单集合
		List<MenuVo> menuVoList = new ArrayList<MenuVo>();
		for (Menu parentMenu : menuList) {
			// 将menu转为menvuVo
			MenuVo menuVo = new MenuVo(parentMenu);
			menuVoList.add(menuVo);
		}
		return menuVoList;
	}

	/**
	 * 子菜单名称集合，即当前用户的权限
	 * 
	 * @param menuList 原始菜单集合
	 * @return 子菜单名称集合
	 */
	private List<String> getMenuNameList(List<Menu> menuList) {
		List<String> menuNameList = new ArrayList<String>();
		for (Menu parentMenu : menuList) {
			for (Menu menu : parentMenu.getMenuList()) {
				menuNameList.add(menu.getName());
			}
		}
		return menuNameList;
	}

	/**
	 * 设置用户session
	 * 
	 * @param user
	 */
	@SuppressWarnings("unused")
	private void setUserSession(User user, List<String> menuNameList) {
		// 获取session
		HttpSession session = SessionUtil.getSession();
		// 用户信息放入拦截器，权限管理
		session.setAttribute("USER_SESSION", user);
		// 菜单集合放入session中
//		session.setAttribute("MENU_LIST_SESSION", menuList);
		// 子菜单集合名称放入session中
		session.setAttribute("MENU_NAME_LIST_SESSION", menuNameList);
		// 设置session最大有效时间，单位为秒
		session.setMaxInactiveInterval(2 * 60 * 60);
		System.out.println("session:"+session.toString());
	}

	@Override
	public User selectByUserName(String userName) {
		return userMapper.selectByUserName(userName);
	}

	@Override
	public User selectByPhone(String phone) {
		return userMapper.selectByPhone(phone);
	}

	@Override
	public User selectByEmail(String email) {
		return userMapper.selectByEmail(email);
	}

	@Override
	public String insert(User user) {
		if (userMapper.insert(user) > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	@Override
	public String updateById(User user) {
		if (userMapper.updateById(user) > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

}
