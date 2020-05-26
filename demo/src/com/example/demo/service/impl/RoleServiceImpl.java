package com.example.demo.service.impl;

import java.util.List;

import com.example.demo.entity.CourseInfo;
import com.example.demo.entity.Role;
import com.example.demo.mapper.RoleMapper;
import com.example.demo.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class RoleServiceImpl  implements RoleService{
	@Autowired
	private RoleMapper roleMapper;
	
	@Override
	public String insert(Role role) {
		int count =roleMapper.countByMykey(role);
		if(count>0){
			return "exist";
		}
		roleMapper.insert(role);
		return null;
	
	}
	
	@Override
	public void update(Role role) {
		roleMapper.update(role) ;
	}
	
	@Override
	public void delete(Integer id) {
		roleMapper.delete(id);
	}
	
	@Override
	public Integer deleteSelection(List<Integer> idList) {
		return roleMapper.deleteSelection(idList);
	}

	@Override
	public Role selectById(Integer id) {
		return roleMapper.selectById(id);
	}
	@Override
	public PageInfo<Role> filter(Role role,Integer pageNum, Integer pageSize) {
		/*return roleMapper.filter(role);*/
		// 设置分页参数
		PageHelper.startPage(pageNum, pageSize);
		// 查询集合
		List<Role> roleList = roleMapper.filter(role);
		PageInfo<Role> pageInfo = new PageInfo<Role>(roleList);
		return pageInfo;
	}


}
