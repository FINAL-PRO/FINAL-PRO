package com.kh.dc.admin.board.model.service;

import java.util.List;

import com.kh.dc.common.vo.Board;

public interface AdminBoardService {
	public List<Board> selectBoardList();

	public Board selectBoardOne(int boardNo);
}
