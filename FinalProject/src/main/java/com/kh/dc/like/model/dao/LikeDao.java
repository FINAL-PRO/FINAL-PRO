package com.kh.dc.like.model.dao;

import com.kh.dc.common.vo.Like;

public interface LikeDao {

	int likeInsert(Like like);

	int likeCount(Like like);

	int likeDelete(Like like);

}
