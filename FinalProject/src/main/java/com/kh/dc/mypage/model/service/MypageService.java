package com.kh.dc.mypage.model.service;

import java.util.List;
import java.util.Map;

public interface MypageService {
	
	List<Map<String, String>> selectCommentList(int cPage, int numPerPage, int mNo);
	
	int selectTotalMyComment(int mNo);
	
	List<Map<String, String>> selectBoardList(int cPage, int numPerPage, int mNo);
	
	int selectTotalMyBoard(int mNo);
	
}
