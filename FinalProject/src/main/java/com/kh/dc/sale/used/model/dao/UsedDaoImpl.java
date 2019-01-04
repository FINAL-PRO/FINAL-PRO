package com.kh.dc.sale.used.model.dao;

import java.util.List;
import java.util.Map;

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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectUsedTotalContents() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Used selectOneUsed(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertUsed(Used used) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertBoard(Used used) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateUsed(Used used) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBoard(Used used) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteUsed(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateViewCount(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Map<String, String>> selectUsedHistory(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, String> selectOneUsedHistory(Map<String, String> uh) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertUsedHistory(Map<String, String> uh) {
		// TODO Auto-generated method stub
		return 0;
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
		return 0;
	}
	

	
}
