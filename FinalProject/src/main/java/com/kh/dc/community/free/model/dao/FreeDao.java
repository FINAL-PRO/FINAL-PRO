package com.kh.dc.community.free.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.BoardList;

public interface FreeDao {
	
	int selectFreeTotalContents(int locationNo);
	
	BoardList selectOneFree(int no);

	int insertBoard(Board board);

	int freeDelete(int bno);

	int freeUpdate(Board board);
	
	int freeViewCount(int bno);

	List<Board> selectFreeListData();

	List<Map<String, String>> recentSort(int cPage, int numberPage, int locationNo);

	List<Map<String, String>> commentSort(int cPage, int numberPage, int locationNo);

	List<Map<String, String>> likeSort(int cPage, int numberPage, int locationNo);
	
}
