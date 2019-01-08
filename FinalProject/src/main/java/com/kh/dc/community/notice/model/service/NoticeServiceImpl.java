package com.kh.dc.community.notice.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.BoardList;
import com.kh.dc.community.notice.model.dao.NoticeDao;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	NoticeDao noticeDao;

	@Override
	public List<Map<String, String>> recentSort(int cPage, int numberPage) {
		return noticeDao.recentSort(cPage, numberPage);
	}
	
	@Override
	public int selectNoticeTotalContents() {
		return noticeDao.selectNoticeTotalContents();
	}

	@Override
	public BoardList selectOneNotice(int bno) {
		return noticeDao.selectOneNotice(bno);
	}

	@Override
	public int insertNotice(Board board) {
		return noticeDao.insertBoard(board);
	}

	@Override
	public int noticeDelete(int bno) {
		return noticeDao.noticeDelete(bno);
	}

	@Override
	public int noticeUpdate(Board board) {
		return noticeDao.noticeUpdate(board);
	}

	@Override
	public int noticeViewCount(int bno) {
		return noticeDao.noticeViewCount(bno);

	}
	
	@Override
	public List<Board> selectNoticeListData() {
		return noticeDao.selectNoticeListData();
	}

}
