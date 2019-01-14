package com.kh.dc.comment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.comment.model.dao.CommentDao;
import com.kh.dc.common.vo.Comment;
import com.kh.dc.message.model.dao.MessageDao;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	CommentDao commentDao;
	@Autowired
	MessageDao messageDao;
	
	@Override
	public int totalComment(int bno) {
		return commentDao.totalComment(bno);
	}

	@Override
	public List<Comment> commentList(int bno) {
		return commentDao.commentList(bno);
	}

	@Override
	public int commentDelete(int cno) {
		return commentDao.commentDelete(cno);
	}

	@Override
	public int commentInsert(Comment comment) {
		System.out.println("comment.getBoardNo() : " + comment.getBoardNo());
		messageDao.replyMSG(comment.getBoardNo());
		
		return commentDao.commentInsert(comment);
	}

	@Override
	public int commentUpdate(Comment comment) {
		return commentDao.commentUpdate(comment);
	}

/*	@Override
	public List<Comment> commentList() {
		// TODO Auto-generated method stub
		return commentDao.commentList();
	}*/
		
}
