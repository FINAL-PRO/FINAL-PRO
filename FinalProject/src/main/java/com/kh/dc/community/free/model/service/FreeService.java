package com.kh.dc.community.free.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.Comment;

public interface FreeService {

	List<Map<String,String>> selectFreeList(int cPage, int numberPage);
	
	int selectFreeTotalContents();
	
	Board selectOneFree(int bno);
	
	int insertFree(Board board);

	int freeDelete(int bno);

	int freeUpdate(Board board);
	
	int freeViewCount(int bno);

	List<Board> selectFreeListData();
	
}
