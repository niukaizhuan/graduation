package com.example.demo.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.example.demo.entity.Menu;
import com.example.demo.entity.UserMenu;
import com.example.demo.entity.vo.MenuTreeVo;
import com.example.demo.mapper.MenuMapper;
import com.example.demo.mapper.UserMenuMapper;
import com.example.demo.service.UserMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class UserMenuServiceImpl implements UserMenuService {

	@Autowired
	private MenuMapper menuMapper;
	
	@Autowired
	private UserMenuMapper userMenuMapper;
	
	
	@Override
	public List<MenuTreeVo> listByUserMenuTree(Integer userId) {
		List<Menu> menuList = menuMapper.selectParentByUserId(userId);
		List<MenuTreeVo> menuTreeVoList = new ArrayList<MenuTreeVo>();
		for (Menu parentMenu : menuList) {
		      MenuTreeVo menuTreeVo = new MenuTreeVo(parentMenu);
		      menuTreeVoList.add(menuTreeVo);
		}
		return menuTreeVoList;
	}


	@Override
	public PageInfo<UserMenu> selectPageInfo(Integer pageNum, Integer pageSize) {
		// 设置分页参数
		PageHelper.startPage(pageNum, pageSize);
		// 查询集合
		List<UserMenu> userMenuList = userMenuMapper.listUserMenu();
		PageInfo<UserMenu> pageInfo = new PageInfo<UserMenu>(userMenuList);
		return pageInfo;
	}


	@Override
	public List<MenuTreeVo> selectParentMenu() {
		List<Menu> menuList = menuMapper.selectParentMenu();
		List<MenuTreeVo> menuTreeVoList = new ArrayList<MenuTreeVo>();
		for (Menu parentMenu : menuList) {
		      MenuTreeVo menuTreeVo = new MenuTreeVo(parentMenu);
		      menuTreeVoList.add(menuTreeVo);
		}
		return menuTreeVoList;
	}

	@Override
	public String editUserMenu(Integer userId, List<Object> menuIdList) {
		String flag = null;
		userMenuMapper.deleteAllByUserId(userId);
		userMenuMapper.addByMenuId(userId, menuIdList);
		flag = "suc";
		return flag;
	}



}
