package com.kh.dc.sale.used.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dc.sale.used.model.vo.Used;

public interface UsedService {

	List<Map<String, String>> selectUsedList(int cPage, int numPerPage);
	
	int selectUsedTotalContents();
	
	Used selectOneUsed(int boardNo);
	
	int insertUsed(Used used);
	
	int insertBoard(Used used);
	
	int updateUsed(Used used);
	
	int updateBoard(Used used);
	
	int deleteUsed(int boardNo);
	
	int updateViewCount(int boardNo);
	
	List<Map<String, String>> selectUsedHistory(int boardNo);
	
	Map<String, String> selectOneUsedHistory(Map<String, String> uh);

	int insertUsedHistory(Map<String, String> uh);
	
	int deleteUsedHistory(Map<String, String> uh);
	
	List<Map<String, String>> selectStatusList();
	
	int updateStatus(Map<String, String> status);

		
}
