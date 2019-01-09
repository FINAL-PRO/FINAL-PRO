package com.kh.dc.mypage.model.service;

import java.util.List;
import java.util.Map;

public interface MypageService {
	
	List<Map<String, String>> selectGroupList(int cPage, int numPerPage, int mNo);
	
	int selectTotalMyComment(int mNo);
	
}
