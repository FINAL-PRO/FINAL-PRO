package com.kh.dc.community.notice.model.dao;

import java.util.List;

import com.kh.dc.common.vo.Board;

public interface NoticeDao {

	List<Board> selectNoticeListData();

}
