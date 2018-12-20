package com.kh.dc.admin.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.Code;

@Repository
public class AdminBoardDaoImpl implements AdminBoardDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Board> selectBoardList(String boardType) {
		return sqlSession.selectList("admin_mapper.selectBoardList", boardType);
	}

	@Override
	public Board selectBoardOne(int boardNo) {
		return sqlSession.selectOne("admin_mapper.selectBoardOne", boardNo);
	}

	@Override
	public List<Code> selectBoardTypeList() {
		return sqlSession.selectList("admin_mapper.selectBoardTypeList");
	}
	
	

}
