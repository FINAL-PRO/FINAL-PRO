package com.kh.dc.community.free.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.BoardList;

@Repository
public class FreeDaoImpl implements FreeDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectFreeList(int cPage, int numberPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numberPage, numberPage);
		return sqlSession.selectList("free_mapper.selectFreeList", null, rowBounds);
	}

	@Override
	public int selectFreeTotalContents() {
		return sqlSession.selectOne("free_mapper.selectFreeTotalContents");
	}

	@Override
	public BoardList selectOneFree(int bno) {
		return sqlSession.selectOne("free_mapper.selectOneFree", bno);

	}

	@Override
	public int insertBoard(Board board) {
		return sqlSession.insert("free_mapper.insertFree", board);
	}

	@Override
	public int freeDelete(int bno) {
		return sqlSession.delete("free_mapper.freeDelete", bno);
	}

	@Override
	public int freeUpdate(Board board) {
		return sqlSession.insert("free_mapper.updateFree", board);
	}
	
	@Override
	public int freeViewCount(int bno) {
		return sqlSession.update("free_mapper.freeViewCount", bno);

	}

	@Override
	public List<Board> selectFreeListData() {
		return sqlSession.selectList("free_mapper.selectFreeListData");
	}
	


}
