package com.kh.dc.admin.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.admin.board.model.dao.AdminBoardDao;
import com.kh.dc.common.vo.Board;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {

	@Autowired
	AdminBoardDao boardDao;
	
	@Override
	public List<Board> selectBoardList() {
		return boardDao.selectBoardList();
	}
}
