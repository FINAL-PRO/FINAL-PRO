package com.kh.dc.job.model.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.common.exception.BoardException;
import com.kh.dc.common.vo.Code;
import com.kh.dc.job.model.dao.JobBoardDao;
import com.kh.dc.job.model.vo.JobBoard;

@Service
public class JobBoardServiceImpl implements JobBoardService {

	Logger logger = LoggerFactory.getLogger(JobBoardServiceImpl.class);
	
	@Autowired
	JobBoardDao jobBoardDao;
	
	@Override
	public List<Map<String, String>> selectJobBoardList(Map<String, String> map, int cPage, int numPerPage) {
		//
		return jobBoardDao.selectJobBoardList(map, cPage, numPerPage);
	}

	@Override
	public int selectJobBoardTotalContents() {
		// 
		return jobBoardDao.selectJobBoardTotalContents();
	}

	@Override
	public int insertBoard(JobBoard jobBoard) {
		// 
		int result = 0;
		int no = 0;
		
		try {
			result = jobBoardDao.insertBoard(jobBoard);
			if(result == Board_SERVICE_ERROR) throw new BoardException();
			
			no = jobBoard.getNo();
			logger.info("no = "+ no);
			
		} catch(Exception e) {
			e.printStackTrace();
			logger.info("게시물등록 불가");
		}
		
		return result;
	}

	@Override
	public int insertJobBoard(JobBoard jobBoard) {
		// 
		int result = 0;
		int no = 0;
		
		try {
			
			result = jobBoardDao.insertBoard(jobBoard);
			
			if(result != Board_SERVICE_ERROR) {
				result = jobBoardDao.insertJobBoard(jobBoard);
				if(result == Board_SERVICE_ERROR) throw new BoardException();
			
				no = jobBoard.getNo();
				logger.info("no = "+ no);
			}
		} catch(Exception e) {
			e.printStackTrace();
			logger.info("게시물등록 불가");
		}
		
		return result;
	}
	
	@Override
	public JobBoard selectOneJobBoard(int no) {
		// 
		JobBoard jobBoard = jobBoardDao.selectOneJobBoard(no);
		
		System.out.println(jobBoard);
		
		if(jobBoard != null) jobBoardDao.updateViewCount(no);
		
		return jobBoard;
		
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
	
	@Override
	public int updateJobBoard(JobBoard jobBoard) {
		// 
		int result = 0;
		int no = 0;
		
		try {
			result = jobBoardDao.updateBoard(jobBoard);
			
			if(result != Board_SERVICE_ERROR) {
				result = jobBoardDao.updateJobBoard(jobBoard);
				no = jobBoard.getNo();
				logger.info("no = "+ no);
			}
		
		} catch(Exception e) {
			logger.info("게시물 업데이트 불가");
		}
			
		return result;
	}
	
	@Override
	public int endJobBoard(int boardNo) {
		// 
		int result = jobBoardDao.endJobBoard(boardNo);
		
		System.out.println(result);
		
		if(result < Board_SERVICE_COMPLETE) throw new BoardException("게시글 마감 실패!");
		
		return result;
	}

	@Override
	public int deleteJobBoard(int boardNo) {
		// 
		int result = jobBoardDao.deleteJobBoard(boardNo);
		
		if(result < Board_SERVICE_COMPLETE) throw new BoardException("게시글 삭제 실패!");
		
		return result;
	}
/*	
	@Override
	public List<JobBoard> selectArrayType(int arrayType) {
		return jobBoardDao.selectArrayType(arrayType);
	}
*/	
	@Override
	public List<Code> selectJobBoardTypeList() {
		return jobBoardDao.selectJobBoardTypeList();
	}
	@Override
	public List<Code> selectJobBoardJobTypeList() {
		return jobBoardDao.selectJobBoardJobTypeList();
	}
	@Override
	public List<Code> selectJobBoardSalTypeList() {
		return jobBoardDao.selectJobBoardSalTypeList();
	}
	
	
	@Override
	public List<Map<String, String>> searchJobBoardList(Map<String, String> map, int cPage, int numPerPage) {
		//
		return jobBoardDao.searchJobBoardList(map, cPage, numPerPage);
	}

	@Override
	public int searchJobBoardTotalContents() {
		// 
		return jobBoardDao.searchJobBoardTotalContents();
	}

}
