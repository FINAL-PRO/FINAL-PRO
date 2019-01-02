package com.kh.dc.community.free.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.BoardList;
import com.kh.dc.community.free.model.dao.FreeDao;

@Service
public class FreeServiceImpl implements FreeService{

	@Autowired
	FreeDao freeDao;

	@Override
	public List<Map<String, String>> selectFreeList(int cPage, int numberPage) {
		return freeDao.selectFreeList(cPage, numberPage);
	}

	@Override
	public int selectFreeTotalContents() {
		return freeDao.selectFreeTotalContents();
	}

	@Override
	public BoardList selectOneFree(int bno) {
		return freeDao.selectOneFree(bno);
	}

	@Override
	public int insertFree(Board board) {
		return freeDao.insertBoard(board);
	}

	@Override
	public int freeDelete(int bno) {
		return freeDao.freeDelete(bno);
	}

	@Override
	public int freeUpdate(Board board) {
		return freeDao.freeUpdate(board);
	}

	@Override
	public int freeViewCount(int bno) {
		return freeDao.freeViewCount(bno);

	}

	@Override
	public List<Board> selectFreeListData() {
		return freeDao.selectFreeListData();
	}

	
}
