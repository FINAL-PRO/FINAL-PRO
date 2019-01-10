package com.kh.dc.sale.group.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.common.vo.Board;
import com.kh.dc.sale.group.model.dao.GroupDao;
import com.kh.dc.sale.group.model.vo.Group;

@Service
public class GroupServiceImpl implements GroupService {

	@Autowired
	GroupDao groupDao;
	
	@Override
	public List<Map<String, String>> selectGroupList(int cPage, int numPerPage) {
		
		List list = groupDao.selectGroupList(cPage, numPerPage);
		
		return list;
	}

	@Override
	public int selectGroupTotalContents() {
		
		return groupDao.selectGroupTotalContents();
	}
 
	@Override
	public Group selectOneGroup(int boardNo) {
		
		Group group = groupDao.selectOneGroup(boardNo);
		
		if(group != null) groupDao.updateViewCount(boardNo);
		
		return group;
	}

	@Override
	public int insertGroup(Group group) {
		
		return groupDao.insertBoard(group) * groupDao.insertGroup(group);
	}

	@Override
	public int updateGroup(Group group) {
		
		return groupDao.updateBoard(group) * groupDao.updateGroup(group);
	}

	@Override
	public int deleteGroup(int boardNo) {

		return groupDao.deleteGroup(boardNo);
	}

	@Override
	public List<Map<String, String>> selectBankList() {
		
		return groupDao.selectBankList();
	}

	@Override
	public List<Map<String, String>> selectGroupHistory(int groupNo) {

		return groupDao.selectGroupHistory(groupNo);
	}

	@Override
	public Map<String, String> selectOneGroupHistory(Map<String, String> gh) {

		return groupDao.selectOneGroupHistory(gh);
	}

	@Override
	public int insertGroupHistory(Map<String, String> gh) {

		return groupDao.insertGroupHistory(gh);
	}

	@Override
	public int deleteGroupHistory(Map<String, String> gh) {

		return groupDao.deleteGroupHistory(gh);
	}

	@Override
	public List<Map<String, String>> selectStatusList() {

		return groupDao.selectStatusList();
	}

	@Override
	public int updateStatus(Map<String, String> status) {
		
		return groupDao.updateStatus(status);
	}
	
	@Override
	public int selectRemainCount(int groupNo) {
		
		return groupDao.selectRemainCount(groupNo);
	}

	@Override
	public List<Board> getGroupListData() {
		return groupDao.getGroupListData();
	}


}
