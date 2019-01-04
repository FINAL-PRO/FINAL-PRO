package com.kh.dc.message.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.common.vo.Message;

@Repository
public class MessageDaoImpl implements MessageDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectMessageList(int no, int cPage, int numPerPage) {
		// 

		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("message_mapper.selectMessageList", no, rowBounds);
	}

	@Override
	public int selectMessageTotalContents(int no) {
		// 
		return sqlSession.selectOne("message_mapper.selectMessageTotalContents", no);
	}

	@Override
	public Message selectOneMessage(int no) {
		// 
		return sqlSession.selectOne("message_mapper.selectOneMessage", no);
	}

	@Override
	public int insertMessage(Message message) {
		// 
		System.out.println("msg DAO 확인 : "+message);
		return sqlSession.insert("message_mapper.insertMessage", message);
	}
	
	@Override
	public int readMessage(int no) {
		// 
		return sqlSession.update("message_mapper.deleteMessage", no);
	}
	@Override
	public int deleteMessage(int no) {
		// 
		return sqlSession.update("message_mapper.deleteMessage", no);
	}

}
