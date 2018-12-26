package com.kh.dc.sale.group.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.sale.group.model.dao.GroupDao;
import com.kh.dc.sale.group.model.vo.Group;

@Service
public class GroupServiceImpl implements GroupService {

	@Autowired
	GroupDao groupDao;
	
	@Override
	public List<Map<String, String>> selectGroupList(int cPage, int numPerPage) {
		
		return groupDao.selectGroupList(cPage, numPerPage);
	}

	@Override
	public int selectGroupTotalContents() {
		
		return groupDao.selectGroupTotalContents();
	}
 
	@Override
	public Group selectOneGroup(int boardNo) {
		
		return groupDao.selectOneGroup(boardNo);
	}

	@Override
	public int insertGroup(Group group) {
		
		return groupDao.insertBoard(group) * groupDao.insertGroup(group);
	}
	
	

}
