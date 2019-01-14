package com.kh.dc.sale.used.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.dc.sale.used.model.vo.Used;

public interface UsedDao {

	List<Map<String, String>> selectUsedList(int cPage, int numPerPage);
	
	int selectUsedTotalContents();
	
	Used selectOneUsed(int boardNo);
	
	int insertUsed(Used used);
	
	int insertBoard(Used used);
	
	int updateUsed(Used used);
	
	int updateBoard(Used used);
	
	int deleteUsed(int boardNo);
	
	int updateViewCount(int boardNo);
	
	Map<String, String> selectOneUsedHistory(int usedNo);

	int insertUsedHistory(Map<String, String> uh);
	
	List<Map<String, String>> selectStatusList();
	
	int updateStatus(Map<String, String> status);

		
}
