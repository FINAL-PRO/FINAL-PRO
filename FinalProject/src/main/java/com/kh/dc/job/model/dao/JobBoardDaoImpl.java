package com.kh.dc.job.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.job.model.vo.JobBoard;

@Repository
public class JobBoardDaoImpl implements JobBoardDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectJobBoardList(int cPage, int numPerPage) {
		// 
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("jobBoard.selectJobBoardList", null, rowBounds);
	}

	@Override
	public int selectJobBoardTotalContents() {
		// 
		return sqlSession.selectOne("jobBoard.selectJobBoardTotalContents");
	}

	@Override
	public int insertJobBoard(JobBoard jobBoard) {
		// 
		return sqlSession.insert("jobBoard.insertJobBoard", jobBoard);
	}

	@Override
	public JobBoard selectOneJobBoard(int no) {
		// 
		return sqlSession.selectOne("jobBoard.selectOneJobBoard", no);
	}

	@Override
	public int updateJobBoard(JobBoard jobBoard) {
		// 
		return sqlSession.update("jobBoard.updateJobBoard", jobBoard);
	}

	@Override
	public int deleteJobBoard(int no) {
		// 
		return sqlSession.update("jobBoard.deleteJobBoard", no);
	}

}
