package com.kh.dc.sale.used.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.sale.used.model.vo.Used;

@Repository
public class UsedDaoImpl implements UsedDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectUsedList(int cPage, int numPerPage) {
		
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("used_mapper.selectUsedList", null, rowBounds);
	}

	@Override
	public int selectUsedTotalContents() {

		return sqlSession.selectOne("used_mapper.selectUsedTotalContents");
	}

	@Override
	public Used selectOneUsed(int boardNo) {

		return sqlSession.selectOne("used_mapper.selectOneUsed", boardNo);
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
	public List<Map<String, String>> selectUsedHistory(int boardNo) {
		// TODO Auto-generated method stub
		return null;
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
	public int deleteUsedHistory(Map<String, String> uh) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Map<String, String>> selectStatusList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateStatus(Map<String, String> status) {
		// TODO Auto-generated method stub
		return sqlSession.update("used_mapper.updateUsedStatus", status);
	}
	

	
}
