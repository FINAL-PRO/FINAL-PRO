package com.kh.dc.message.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.message.model.vo.Message;

@Repository
public class MessageDaoImpl implements MessageDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectMessageList(int cPage, int numPerPage) {
		// 
		return null;
	}

	@Override
	public int selectMessageTotalContents() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertMessage(Message message) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Message selectOneMessage(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteMessage(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

}
