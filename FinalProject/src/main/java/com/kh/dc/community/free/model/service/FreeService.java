package com.kh.dc.community.free.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.BoardList;

public interface FreeService {
	
	List<Map<String,String>> recentSort(int cPage, int numberPage);
	
	List<Map<String,String>> commentSort(int cPage, int numberPage);
	
	List<Map<String,String>> likeSort(int cPage, int numberPage);
	
	int selectFreeTotalContents();
	
	BoardList selectOneFree(int bno);
	
	int insertFree(Board board);

	int freeDelete(int bno);

	int freeUpdate(Board board);
	
	int freeViewCount(int bno);

	List<Board> selectFreeListData();
	
}
