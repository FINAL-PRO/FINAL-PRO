package com.kh.dc.job.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.dc.job.model.vo.JobBoard;

public interface JobBoardDao {
	
	List<Map<String, String>> selectJobBoardList(int cPage, int numPerPage);

	int selectJobBoardTotalContents();
	
	int insertJobBoard(JobBoard jobBoard);
	
	JobBoard selectOneJobBoard(int no);
	
	int updateJobBoard(JobBoard jobBoard);
	
	int deleteJobBoard(int no);
	
}
