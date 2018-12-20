package com.kh.dc.message.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.dc.message.model.vo.Message;

public interface MessageDao {
	List<Map<String, String>> selectMessageList(int cPage, int numPerPage);
	// 쪽지갯수
	int selectMessageTotalContents();
	// 쪽지작성
	int insertMessage(Message message);
	// 쪽지선택
	Message selectOneMessage(int no);
	// 쪽지삭제
	int deleteMessage(int no);
}
