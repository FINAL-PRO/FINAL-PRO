package com.kh.dc.job.model.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.common.exception.BoardException;
import com.kh.dc.job.model.dao.JobBoardDao;
import com.kh.dc.job.model.vo.JobBoard;

@Service
public class JobBoardServiceImpl implements JobBoardService {

	Logger logger = LoggerFactory.getLogger(JobBoardServiceImpl.class);
	
	@Autowired
	JobBoardDao jobBoardDao;
	
	@Override
	public List<Map<String, String>> selectJobBoardList(int cPage, int numPerPage) {
		//
		return jobBoardDao.selectJobBoardList(cPage, numPerPage);
	}

	@Override
	public int selectJobBoardTotalContents() {
		// 
		return jobBoardDao.selectJobBoardTotalContents();
	}

	@Override
	public int insertJobBoard(JobBoard jobBoard) {
		// 
		int result = 0;
		int no = 0;
		
		try {
			result = jobBoardDao.insertJobBoard(jobBoard);
			if(result == Board_SERVICE_ERROR) throw new BoardException();
			
			no = jobBoard.getNo();
			logger.info("no = "+ no);
			
			result = jobBoardDao.insertJobBoard(jobBoard);
			if(result == Board_SERVICE_ERROR) throw new BoardException();
			
		} catch(Exception e) {
			logger.info("게시물등록 불가");
		}
		
		return result;
	}

	@Override
	public JobBoard selectOneJobBoard(int no) {
		// 
		return jobBoardDao.selectOneJobBoard(no);
	}

	@Override
	public int updateJobBoard(JobBoard jobBoard) {
		// 
		int result = 0;
		
		try {
			result = jobBoardDao.updateJobBoard(jobBoard);
		
		} catch(Exception e) {
			logger.info("게시물 업데이트 불가");
		}
			
		return result;
	}

	@Override
	public int deleteJobBoard(int no) {
		// 
		int result = jobBoardDao.deleteJobBoard(no);
		
		if(result < Board_SERVICE_COMPLETE) throw new BoardException("게시글 삭제 실패!");
		
		return result;
	}

	@Override
	public List<Map<String, String>> selectJobBoardComPop(int cPage, int numPerPage) {
		//
		return jobBoardDao.selectJobBoardComPop(cPage, numPerPage);
	}
	@Override
	public int selectJobBoardComPopTotalContents() {
		// 
		return jobBoardDao.selectJobBoardComPopTotalContents();
	}
}
