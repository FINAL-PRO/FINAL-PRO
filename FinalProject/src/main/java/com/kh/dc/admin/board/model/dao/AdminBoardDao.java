package com.kh.dc.admin.board.model.dao;

import java.util.List;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.Code;

public interface AdminBoardDao {
	
	public List<Board> selectBoardList(String boardType, String boardStatus);

	public Board selectBoardOne(int boardNo);

	public List<Code> selectBoardTypeList();

	public int insertNotice(Board board);

	public List<Code> selectBoardStatusList();

	public int changeBoardStatus(int boardNo, String status);
}
