package com.kh.dc.sale.group.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dc.sale.group.model.vo.Group;

public interface GroupService {
	
	List<Map<String, String>> selectGroupList(int cPage, int numPerPage);
	
	int selectGroupTotalContents();
	
	Group selectOneGroup(int boardNo);
	
}
