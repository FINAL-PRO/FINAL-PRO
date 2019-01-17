package com.kh.dc.message.model.service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.kh.dc.common.vo.Message;
import com.kh.dc.member.model.vo.Member;

public interface MessageService {
	static int Board_SERVICE_ERROR = 0;
	static int Board_SERVICE_COMPLETE = 1;
	// 목록조회, 페이징
	List<Map<String, String>> selectMessageList(int no, int cPage, int numPerPage);	
	// 쪽지갯수
	int selectMessageTotalContents(int no);
	// 쪽지작성
	int insertMessage(Message message);
	// 쪽지선택
	Message selectOneMessage(int no);
	// 쪽지삭제
	int deleteMessage(int no);

	int checkToNick(String nickName);
	
	int countUnreadMSG(int memNo);
	
	List<Map<String, String>> sendMsg(int fromMember, int cPage, int numPerPage);
	
	int sendMsgTotalContents(int fromMember);
}
