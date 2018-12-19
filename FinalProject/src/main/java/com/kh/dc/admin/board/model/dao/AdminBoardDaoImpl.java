package com.kh.dc.admin.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.common.vo.Board;

@Repository
public class AdminBoardDaoImpl implements AdminBoardDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Board> selectBoardList() {
		return sqlSession.selectList("admin_mapper.selectBoardList");
	}
	
	

}
