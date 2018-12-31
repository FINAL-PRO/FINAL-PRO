package com.kh.dc.like.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.common.vo.Like;
import com.kh.dc.like.model.dao.LikeDao;

@Service
public class LikeServiceImpl implements LikeService {

	@Autowired
	LikeDao likeDao;
	
	@Override
	public int like_check(HashMap<String, Object> hmap) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void like_uncheck(HashMap<String, Object> hmap) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int likecount(int bno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int likeInsert(Like like) {
		return likeDao.likeInsert(like);
	}

}
