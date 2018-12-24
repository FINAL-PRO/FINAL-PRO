package com.kh.dc.job.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.dc.job.model.vo.JobBoard;

public interface JobBoardService {
	static int Board_SERVICE_ERROR = 0;
	static int Board_SERVICE_COMPLETE = 1;
	
	List<Map<String, String>> selectJobBoardList(int cPage, int numPerPage);

	int selectJobBoardTotalContents();
	
	int insertJobBoard(JobBoard jobBoard);
	
	JobBoard selectOneJobBoard(int no);
	
	int updateJobBoard(JobBoard jobBoard);
	
	int deleteJobBoard(int no);
	
}
