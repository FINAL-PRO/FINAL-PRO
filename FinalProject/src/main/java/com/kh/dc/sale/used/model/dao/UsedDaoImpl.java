package com.kh.dc.sale.used.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.common.vo.Board;
import com.kh.dc.sale.used.model.vo.Used;

@Repository
public class UsedDaoImpl implements UsedDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectUsedList(int cPage, int numPerPage, int locationNo) {
		
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("used_mapper.selectUsedList", locationNo, rowBounds);
	}

	@Override
	public int selectUsedTotalContents(int locationNo) {

		return sqlSession.selectOne("used_mapper.selectUsedTotalContents", locationNo);
	}

	@Override
	public Used selectOneUsed(int boardNo) {

		return sqlSession.selectOne("used_mapper.selectOneUsed", boardNo);
	}
	
	@Override
	public Used selectOneUsed2(int boardNo) {

		return sqlSession.selectOne("used_mapper.selectOneUsed2", boardNo);
	}

	@Override
	public int insertUsed(Used used) {

		return sqlSession.insert("used_mapper.insertUsed", used);
	}

	@Override
	public int insertBoard(Used used) {

		return sqlSession.insert("used_mapper.insertBoard", used);
	}

	@Override
	public int updateUsed(Used used) {
		
		return sqlSession.update("used_mapper.updateUsed", used);
	}

	@Override
	public int updateBoard(Used used) {
		
		return sqlSession.update("used_mapper.updateBoard", used);
	}

	@Override
	public int deleteUsed(int boardNo) {

		return sqlSession.update("used_mapper.deleteUsed", boardNo);
	}

	@Override
	public int updateViewCount(int boardNo) {

		return sqlSession.update("used_mapper.updateViewCount", boardNo);
	}

	@Override
	public Map<String, String> selectOneUsedHistory(int usedNo) {

		return sqlSession.selectOne("used_mapper.selectOneUsedHistory", usedNo);
	}

	@Override
	public int insertUsedHistory(Map<String, String> uh) {

		return sqlSession.insert("used_mapper.insertUsedHistory", uh);
	}

	@Override
	public List<Map<String, String>> selectStatusList() {
		
		return sqlSession.selectList("used_mapper.selectStatusList");
	}

	@Override
	public int updateStatus(Map<String, String> status) {

		return sqlSession.update("used_mapper.updateUsedStatus", status);
	}

	@Override
	public int updateUsedHistroy(Map<String, String> uhMap) {

		return sqlSession.update("used_mapper.updateUsedHistroy", uhMap);
	}

	@Override
	public List<Board> selectMainUsedList() {
		return sqlSession.selectList("used_mapper.selectMainUsedList");
	}
	

	
}
