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
	public int insertJobBoard(JobBoard jobBoard, String attachedFile) {
		// 
		int result = 0;
		int boardNo = 0;
		
		try {
			result = jobBoardDao.insertJobBoard(jobBoard);
			if(result == Board_SERVICE_ERROR) throw new BoardException();
			
			boardNo = jobBoard.getBoardNo();
			logger.info("baordNo = "+ boardNo);
			
			result = jobBoardDao.insertJobBoard(jobBoard);
			if(result == Board_SERVICE_ERROR) throw new BoardException();
			
			
			
			
		} catch(Exception e) {
			logger.info("게시물등록 불가");
		}
		
		return result;
	}

	@Override
	public JobBoard selectOneJobBoard(int boardNo) {
		// 
		return jobBoardDao.selectOneJobBoard(boardNo);
	}

	@Override
	public String selectAttachedFile(int boardNo) {
		// 
		return jobBoardDao.selectAttachedFile(boardNo);
	}

	@Override
	public int updateJobBoard(JobBoard jobBoard, String attachedFile) {
		// 
		int result = 0;
	
		String originFile = jobBoardDao.selectAttachedFile(jobBoard.getBoardNo());
		
		try {
			result = jobBoardDao.updateJobBoard(jobBoard);
		
		} catch(Exception e) {
			logger.info("게시물 업데이트 불가");
		}
			
		return result;
	}

	@Override
	public int deleteJobBoard(int boardNo) {
		// 
		int result = jobBoardDao.deleteJobBoard(boardNo);
		
		if(result > Board_SERVICE_ERROR && jobBoardDao.selectAttachedFile(boardNo) != null)
			result = jobBoardDao.deleteJobFile(boardNo);
		else if(result > Board_SERVICE_ERROR) result = Board_SERVICE_COMPLETE;
		else throw new BoardException("게시글 삭제 실패!");
		
		if(result < Board_SERVICE_COMPLETE) throw new BoardException("게시글 삭제 실패!");
		
		return result;
	}

	@Override
	public int deleteJobFile() {
		// TODO Auto-generated method stub
		return jobBoardDao.deleteJobFile();
	}

}
