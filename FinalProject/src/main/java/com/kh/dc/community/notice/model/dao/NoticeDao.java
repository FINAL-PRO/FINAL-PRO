package com.kh.dc.community.notice.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.BoardList;

public interface NoticeDao {

	List<Map<String, String>> recentSort(int cPage, int numberPage);
	
	int selectNoticeTotalContents();
	
	BoardList selectOneNotice(int no);

	int insertBoard(Board board);

	int noticeDelete(int bno);

	int noticeUpdate(Board board);
	
	int noticeViewCount(int bno);
	
	List<Board> selectNoticeListData();

}
