package com.example.demo.test;

import java.util.ArrayList;
import java.util.List;

import com.example.demo.entity.Menu;
import com.example.demo.entity.vo.MenuVo;
import com.example.demo.mapper.MenuMapper;
import com.example.demo.test.BaseTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class MenuMapperTest extends BaseTest {

	@Autowired
	private MenuMapper menuMapper;

	@Test
	public void listMenuByUserId() {
		List<Menu> menuList = menuMapper.listMenuByUserId(19);
		List<MenuVo> menuVoList = new ArrayList<MenuVo>();
		for (Menu parentMenu : menuList) {
			MenuVo menuVo = new MenuVo(parentMenu);

			System.out.println(menuVo);
			for (MenuVo childmenuVo : menuVo.getMenuList()) {
				System.out.println("     " + childmenuVo);
			}
			menuVoList.add(menuVo);
		}

	}

}
