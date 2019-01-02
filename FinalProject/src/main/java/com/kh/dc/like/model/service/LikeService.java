package com.kh.dc.like.model.service;

import java.util.HashMap;

import com.kh.dc.common.vo.Like;

public interface LikeService {

	int like_check(HashMap<String, Object> hmap);

	void like_uncheck(HashMap<String, Object> hmap);

	int likecount(int bno);

	int likeInsert(Like like);

}
