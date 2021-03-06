package com.kh.dc.sale.group.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.dc.common.vo.Board;
import com.kh.dc.sale.group.model.vo.Group;

public interface GroupDao {

	List<Map<String, String>> selectGroupList(int cPage, int numPerPage, int locationNo);
	
	int selectGroupTotalContents(int locationNo);
	
	Group selectOneGroup(int boardNo);
	
	int insertGroup(Group group);
	
	int insertBoard(Group group);
	
	int updateGroup(Group group);
	
	int updateBoard(Group group);
	
	int deleteGroup(int boardNo);
	
	int updateViewCount(int boardNo);
	
	List<Map<String, String>> selectBankList();
	
	List<Map<String, String>> selectGroupHistory(int boardNo);
	
	Map<String, String> selectOneGroupHistory(Map<String, String> gh);

	int insertGroupHistory(Map<String, String> gh);
	
	int deleteGroupHistory(Map<String, String> gh);
	
	List<Map<String, String>> selectStatusList();
	
	int updateStatus(Map<String, String> status);
	
	int selectRemainCount(int groupNo);

	List<Board> getGroupListData();

	List<Board> selectGroupList();

	Group selectOneGroup2(int boardNo);
		
}
