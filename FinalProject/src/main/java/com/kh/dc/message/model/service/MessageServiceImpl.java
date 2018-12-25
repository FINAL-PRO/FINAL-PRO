package com.kh.dc.message.model.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.message.model.dao.MessageDao;
import com.kh.dc.message.model.vo.Message;

@Service
public class MessageServiceImpl implements MessageService {

	Logger logger = LoggerFactory.getLogger(MessageServiceImpl.class);
	
	@Autowired
	MessageDao messageDao;
	
	@Override
	public List<Map<String, String>> selectMessageList(int cPage, int numPerPage) {
		// 
		return messageDao.selectMessageList(cPage, numPerPage);
	}

	@Override
	public int selectMessageTotalContents() {
		// 
		return messageDao.selectMessageTotalContents();
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
			
		}
		
		return result;
	}

	@Override
	public Message selectOneMessage(int no) {
		// 
		return messageDao.selectOneMessage(no);
	}

	@Override
	public int deleteMessage(int no) {
		// 
		return messageDao.deleteMessage(no);
	}

}
