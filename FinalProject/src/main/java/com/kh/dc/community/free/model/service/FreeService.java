package com.kh.dc.community.free.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dc.common.vo.Board;

public interface FreeService {

	List<Map<String,String>> selectFreeList(int cPage, int numberPage);
	
	int selectFreeTotalContents();
	
	Board selectOneFree(int no);
	
	int insertFree(Board board);

	int freeDelete(int no);

	int freeUpdate(Board board);
	
}
