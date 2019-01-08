package com.kh.dc.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.dc.mypage.model.dao.MypageDao;

public class MypageServiceImpl implements MypageDao {
	
	@Autowired
	MypageDao mypageDao;

	@Override
	public List<Map<String, String>> selectGroupList(int cPage, int numPerPage) {		
		return mypageDao.selectGroupList(cPage, numPerPage);
	}

	@Override
	public int selectGroupTotalContents() {
		return mypageDao.selectGroupTotalContents();
	}

}
