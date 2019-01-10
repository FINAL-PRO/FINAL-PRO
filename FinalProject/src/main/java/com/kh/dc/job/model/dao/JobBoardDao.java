package com.kh.dc.job.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.dc.common.vo.Code;
import com.kh.dc.job.model.vo.JobBoard;

public interface JobBoardDao {
	
	List<Map<String, String>> selectJobBoardList(Map<String, String> map, int cPage, int numPerPage);

	int selectJobBoardTotalContents();
	
	int insertBoard(JobBoard jobBoard);
	
	int insertJobBoard(JobBoard jobBoard);
	
	JobBoard selectOneJobBoard(int no);

	List<Map<String, String>> selectJobBoardComPop(int cPage, int numPerPage);

	int selectJobBoardComPopTotalContents();

	int updateBoard(JobBoard jobBoard);
	
	int updateJobBoard(JobBoard jobBoard);
	
	int updateViewCount(int no);
	
	int deleteJobBoard(int boardNo);

	//List<JobBoard> selectArrayType(int arrayType);

	List<Code> selectJobBoardTypeList();

	List<Code> selectJobBoardJobTypeList();

	List<Code> selectJobBoardSalTypeList();

}
