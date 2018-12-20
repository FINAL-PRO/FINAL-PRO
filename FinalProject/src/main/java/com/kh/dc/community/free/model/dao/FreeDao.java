package com.kh.dc.community.free.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.dc.common.vo.Board;

public interface FreeDao {

	List<Map<String, String>> selectFreeList(int cPage, int numberPage);
	
	int selectFreeTotalContents();
	
	Board selectOneFree(int no);

	int insertBoard(Board board);
	
}
