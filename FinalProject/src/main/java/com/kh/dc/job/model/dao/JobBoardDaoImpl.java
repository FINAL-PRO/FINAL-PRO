package com.kh.dc.job.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.common.vo.Code;
import com.kh.dc.job.model.vo.JobBoard;

@Repository
public class JobBoardDaoImpl implements JobBoardDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectJobBoardList(Map<String, String> map, int cPage, int numPerPage) {
		// 
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("jobBoard_mapper.selectJobBoardList", map, rowBounds);
	}

	@Override
	public int selectJobBoardTotalContents() {
		// 
		return sqlSession.selectOne("jobBoard_mapper.selectJobBoardTotalContents");
	}

	@Override
	public int insertBoard(JobBoard jobBoard) {
		// 
		System.out.println(jobBoard);
		return sqlSession.insert("jobBoard_mapper.insertBoard", jobBoard);
	}
	@Override
	public int insertJobBoard(JobBoard jobBoard) {
		// 
		System.out.println(jobBoard);
		return sqlSession.insert("jobBoard_mapper.insertJobBoard", jobBoard);
	}
	
	@Override
	public JobBoard selectOneJobBoard(int no) {
		// 
		return sqlSession.selectOne("jobBoard_mapper.selectOneJobBoard", no);
	}

	@Override
	public List<Map<String, String>> selectJobBoardComPop(int cPage, int numPerPage) {
		// 
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("jobBoard_mapper.selectJobBoardComPop", null, rowBounds);
	}
	@Override
	public int selectJobBoardComPopTotalContents() {
		// 
		return sqlSession.selectOne("jobBoard_mapper.selectJobBoardComPopTotalContents");
	}
	
	@Override
	public int updateBoard(JobBoard jobBoard) {
		// 
		System.out.println(jobBoard);
		return sqlSession.update("jobBoard_mapper.updateBoard", jobBoard);
	}
	@Override
	public int updateJobBoard(JobBoard jobBoard) {
		//
		System.out.println(jobBoard);
		return sqlSession.update("jobBoard_mapper.updateJobBoard", jobBoard);
	}
	
	public int updateViewCount(int no) {
		// 
		return sqlSession.update("jobBoard_mapper.updateViewCount", no);
	}

	@Override
	public int endJobBoard(int boardNo) {
		// 
		
		System.out.println("dao");
		return sqlSession.update("jobBoard_mapper.endJobBoard", boardNo);
	}
	
	@Override
	public int deleteJobBoard(int boardNo) {
		// 
		return sqlSession.update("jobBoard_mapper.deleteJobBoard", boardNo);
	}

	@Override
	public List<Code> selectJobBoardTypeList() {
		return sqlSession.selectList("jobBoard_mapper.selectJobBoardTypeList");
	}	
	@Override
	public List<Code> selectJobBoardJobTypeList() {
		return sqlSession.selectList("jobBoard_mapper.selectJobBoardJobTypeList");
	}	
	@Override
	public List<Code> selectJobBoardSalTypeList() {
		return sqlSession.selectList("jobBoard_mapper.selectJobBoardSalTypeList");
	}

	
	@Override
	public List<Map<String, String>> searchJobBoardList(Map<String, String> map, int cPage, int numPerPage) {
		// 
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("jobBoard_mapper.searchJobBoardList", map, rowBounds);
	}

	@Override
	public int searchJobBoardTotalContents() {
		// 
		return sqlSession.selectOne("jobBoard_mapper.selectJobBoardTotalContents");
	}

}
