package com.kh.dc.like.model.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.common.vo.Like;
import com.kh.dc.like.model.dao.LikeDao;

@Service
public class LikeServiceImpl implements LikeService {

	@Autowired
	LikeDao likeDao;

	@Override
	public int likeInsert(Like like) {
		return likeDao.likeInsert(like);
	}

	@Override
	public int likeCount(Like like) {
		System.out.println("likecount service:"+like);
		return likeDao.likeCount(like);
	}

	@Override
	public int likeDelete(Like like) {
		return likeDao.likeDelete(like);
	}

}
