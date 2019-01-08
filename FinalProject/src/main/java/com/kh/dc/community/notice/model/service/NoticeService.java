package com.kh.dc.community.notice.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.BoardList;

public interface NoticeService {

	List<Board> selectNoticeListData();
	
	List<Map<String,String>> recentSort(int cPage, int numberPage);
	
	int selectNoticeTotalContents();
	
	BoardList selectOneNotice(int bno);
	
	int insertNotice(Board board);

	int noticeDelete(int bno);

	int noticeUpdate(Board board);
	
	int noticeViewCount(int bno);

}
