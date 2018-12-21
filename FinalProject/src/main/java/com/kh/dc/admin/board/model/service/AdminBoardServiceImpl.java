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
	public List<Board> selectBoardList(String boardType) {
		return boardDao.selectBoardList(boardType);
	}

	@Override
	public List<Code> selectBoardTypeList() {
		return boardDao.selectBoardTypeList();
	}
}
