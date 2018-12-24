package com.kh.dc.community.free.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.common.vo.Board;
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
	public Board selectOneFree(int no) {
		return freeDao.selectOneFree(no);
	}

	@Override
	public int insertFree(Board board) {
		return freeDao.insertBoard(board);
	}

	@Override
	public int freeDelete(int no) {
		return freeDao.freeDelete(no);
	}

	@Override
	public int freeUpdate(Board board) {
		return freeDao.freeUpdate(board);
	}
	
}
