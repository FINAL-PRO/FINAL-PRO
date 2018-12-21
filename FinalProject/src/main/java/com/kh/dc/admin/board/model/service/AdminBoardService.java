package com.kh.dc.admin.board.model.service;

import java.util.List;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.Code;

public interface AdminBoardService {
	public List<Board> selectBoardList(String boardType);

	public Board selectBoardOne(int boardNo);

	public List<Code> selectBoardTypeList();
}
