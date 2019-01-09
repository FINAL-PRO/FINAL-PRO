package com.kh.dc.mypage.model.dao;

import java.util.List;
import java.util.Map;

public interface MypageDao {
	
	List<Map<String, String>> selectGroupList(int cPage, int numPerPage, int mNo);
	
	int selectTotalMyComment(int mNo);

}
