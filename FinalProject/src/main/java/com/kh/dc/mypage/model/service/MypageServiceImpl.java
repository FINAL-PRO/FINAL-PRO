package com.kh.dc.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.mypage.model.dao.MypageDao;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	MypageDao mypageDao;

	@Override
	public List<Map<String, String>> selectCommentList(int cPage, int numPerPage, int mNo) {		
		return mypageDao.selectCommentList(cPage, numPerPage, mNo);
	}

	@Override
	public int selectTotalMyComment(int mNo) {
		return mypageDao.selectTotalMyComment(mNo);
	}

	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage, int mNo) {
		return mypageDao.selectBoardList(cPage, numPerPage, mNo);
	}

	@Override
	public int selectTotalMyBoard(int mNo) {
		return mypageDao.selectTotalMyBoard(mNo);
	}

}
