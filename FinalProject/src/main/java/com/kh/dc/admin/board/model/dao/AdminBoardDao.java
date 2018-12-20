package com.kh.dc.admin.board.model.dao;

import java.util.List;

import com.kh.dc.common.vo.Board;

public interface AdminBoardDao {
	
	public List<Board> selectBoardList();
}
