package com.kh.dc.message.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.dc.common.vo.Comment;
import com.kh.dc.common.vo.Message;
import com.kh.dc.member.model.vo.Member;


public interface MessageDao {
	List<Map<String, String>> selectMessageList(int no, int cPage, int numPerPage);
	// 쪽지갯수
	int selectMessageTotalContents(int no);
	// 쪽지작성
	int insertMessage(Message message);
	// 쪽지선택
	Message selectOneMessage(int no);
	// 쪽지읽음
	int readMessage(int no);
	// 쪽지삭제
	int deleteMessage(int no);
	
	int checkToNick(HashMap<String, Object> hmap);
	
	int countUnreadMSG(int memNo);
	
	int replyMSG(Comment comment, int bno);
	
	List<Map<String, String>> sendMsg(int fromMember, int cPage, int numPerPage);
	
	int sendMsgTotalContents(int fromMember);
}
