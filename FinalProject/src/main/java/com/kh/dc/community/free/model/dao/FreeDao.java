package com.kh.dc.community.free.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.BoardList;
import com.kh.dc.common.vo.Comment;

public interface FreeDao {

	List<Map<String, String>> selectFreeList(int cPage, int numberPage);
	
	int selectFreeTotalContents();
	
	BoardList selectOneFree(int no);
	
	/*List<Map<String, String>> selectOneFree(int cPage, int numberPage, int no);*/

	int insertBoard(Board board);

	int freeDelete(int no);

	int freeUpdate(Board board);
	
	int freeViewCount(int no);

	List<Board> selectFreeListData();
	
}
