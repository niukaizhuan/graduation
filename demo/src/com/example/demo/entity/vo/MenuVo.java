package com.example.demo.entity.vo;

import com.example.demo.entity.Menu;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * 返给客户端的菜单
 *
 */
@Data
public class MenuVo {

	public MenuVo() {
		super();
	}

	public MenuVo(Menu menu) {
		super();
		this.id=menu.getId();
		this.name = menu.getName();
		this.title = menu.getTitle();
		if (menu.getMenuList() != null) {
			// 初始化，否则add会空指针异常
			this.menuList = new ArrayList<MenuVo>();
			for (Menu childMenu : menu.getMenuList()) {
				// 创建子菜单时，会递归的往下创建子菜单的子菜单
				MenuVo childMenuVo = new MenuVo(childMenu);
				this.menuList.add(childMenuVo);
			}
		}
	}

	/**
	 * 标识
	 */
	private Integer id;
	
	/**
	 * 使用页面请求路径作为菜单项的唯一标识
	 */
	private String name;

	/**
	 * 菜单标题
	 */
	private String title;

	/**
	 * 子菜单
	 */
	private List<MenuVo> menuList;
}
