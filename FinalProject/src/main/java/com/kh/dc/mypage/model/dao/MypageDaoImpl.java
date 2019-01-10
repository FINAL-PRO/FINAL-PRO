package com.kh.dc.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDaoImpl implements MypageDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectCommentList(int cPage, int numPerPage, int mNo) {		
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("member_mapper.selectMyCommentList", mNo, rowBounds);
	}

	@Override
	public int selectTotalMyComment(int mNo) {
		return sqlSession.selectOne("member_mapper.selectTotalMyComment", mNo);
	}

	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage, int mNo) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("member_mapper.selectMyBoardList", mNo, rowBounds);
	}

	@Override
	public int selectTotalMyBoard(int mNo) {
		return sqlSession.selectOne("member_mapper.selectTotalMyBoard", mNo);
	}

}
