package com.kh.dc.sale.group.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.dc.sale.group.model.vo.Group;

public interface GroupDao {

	List<Map<String, String>> selectGroupList(int cPage, int numPerPage);
	
	int selectGroupTotalContents();
	
	Group selectOneGroup(int boardNo);
	
	int insertGroup(Group group);
	
	int insertBoard(Group group);
	
	
}
