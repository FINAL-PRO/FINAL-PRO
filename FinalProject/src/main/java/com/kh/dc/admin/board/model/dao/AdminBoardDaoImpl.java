package com.kh.dc.admin.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.common.vo.AdminBoard;
import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.Code;

@Repository
public class AdminBoardDaoImpl implements AdminBoardDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public Board selectBoardOne(int boardNo) {
		return sqlSession.selectOne("admin_mapper.selectBoardOne", boardNo);
	}

	@Override
	public List<Code> selectBoardTypeList() {
		return sqlSession.selectList("admin_mapper.selectBoardTypeList");
	}

	@Override
	public int insertNotice(Board board) {
		return sqlSession.insert("admin_mapper.insertNotice", board);
	}

	@Override
	public List<Board> selectBoardList(String boardType, String boardStatus) {
		AdminBoard aBoard = new AdminBoard(boardType, boardStatus);
		System.out.println("TYPES : " + aBoard);
		return sqlSession.selectList("admin_mapper.selectBoardList", aBoard);
	}

	@Override
	public List<Code> selectBoardStatusList() {
		return sqlSession.selectList("admin_mapper.selectBoardStatusList");
	}
	
	

}
