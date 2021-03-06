package com.kh.dc.message.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.common.vo.Message;
import com.kh.dc.job.model.vo.JobBoard;
import com.kh.dc.member.model.vo.Member;
import com.kh.dc.message.model.dao.MessageDao;
@Service
public class MessageServiceImpl implements MessageService {

	Logger logger = LoggerFactory.getLogger(MessageServiceImpl.class);
	
	@Autowired
	MessageDao messageDao;
	
	@Override
	public List<Map<String, String>> selectMessageList(int no, int cPage, int numPerPage) {
		// 

		return messageDao.selectMessageList(no, cPage, numPerPage);
	}

	@Override
	public int selectMessageTotalContents(int no) {
		// 
		return messageDao.selectMessageTotalContents(no);
	}

	@Override
	public int insertMessage(Message message) {
		// 
		int result = 0;
		int no = 0;
		
		try {
			result = messageDao.insertMessage(message);
			if(result == Board_SERVICE_ERROR);
			
			no = message.getNo();
			logger.info("MsgNo : "+ no);
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Message selectOneMessage(int no) {
		// 
		Message message =  messageDao.selectOneMessage(no);
		
		if(message.getStatus().equals("MSGTYPE001")) messageDao.readMessage(no);
		
		return message;
	}
	
	@Override
	public int deleteMessage(int no) {
		// 
		return messageDao.deleteMessage(no);
	}

	@Override
	public int checkToNick(String nickName) {
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("nickName", nickName);
		
		return messageDao.checkToNick(hmap);
	}

	@Override
	public int countUnreadMSG(int memNo) {
		// 
		return messageDao.countUnreadMSG(memNo);
	}

	@Override
	public List<Map<String, String>> sendMsg(int fromMember, int cPage, int numPerPage) {
		// 
		return messageDao.sendMsg(fromMember, cPage, numPerPage);
	}

	@Override
	public int sendMsgTotalContents(int fromMember) {
		// 
		return messageDao.sendMsgTotalContents(fromMember);
	}
}
