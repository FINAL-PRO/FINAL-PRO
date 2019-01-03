package com.kh.dc.like.model.service;


import com.kh.dc.common.vo.Like;

public interface LikeService {

	int likeCount(Like like);

	int likeInsert(Like like);

	int likeDelete(Like like);
	
}
