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
	public int selectFreeTotalContents(int locationNo) {
		return freeDao.selectFreeTotalContents(locationNo);
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

	@Override
	public List<Map<String, String>> recentSort(int cPage, int numberPage, int locationNo) {
		return freeDao.recentSort(cPage, numberPage, locationNo);
	}

	@Override
	public List<Map<String, String>> commentSort(int cPage, int numberPage, int locationNo) {
		return freeDao.commentSort(cPage, numberPage, locationNo);
	}

	@Override
	public List<Map<String, String>> likeSort(int cPage, int numberPage, int locationNo) {
		return freeDao.likeSort(cPage, numberPage, locationNo);
	}

	
}
