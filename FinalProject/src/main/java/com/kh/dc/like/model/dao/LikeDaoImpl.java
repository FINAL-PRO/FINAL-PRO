package com.kh.dc.like.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.common.vo.Like;

@Repository
public class LikeDaoImpl implements LikeDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int likeInsert(Like like) {
		return sqlSession.insert("like_mapper.likeInsert", like);
	}

}
