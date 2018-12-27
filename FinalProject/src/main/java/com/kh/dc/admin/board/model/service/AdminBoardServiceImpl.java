package com.kh.dc.admin.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.admin.board.model.dao.AdminBoardDao;
import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.Code;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {

	@Autowired
	AdminBoardDao boardDao;
	
	@Override
	public Board selectBoardOne(int boardNo) {
		return boardDao.selectBoardOne(boardNo);
	}

	@Override
	public List<Code> selectBoardTypeList() {
		return boardDao.selectBoardTypeList();
	}

	@Override
	public int insertNotice(Board board) {
		return boardDao.insertNotice(board);
	}

	@Override
	public List<Board> selectBoardList(String boardType, String boardStatus) {
		return boardDao.selectBoardList(boardType, boardStatus);
	}

	@Override
	public List<Code> selectBoardStatusList() {
		return boardDao.selectBoardStatusList();
	}

	@Override
	public int changeBoardStatus(int boardNo, String status) {
		return boardDao.changeBoardStatus(boardNo, status);
	}
}
