package com.kh.dc.comment.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.comment.model.dao.CommentDao;
import com.kh.dc.common.vo.Comment;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	CommentDao commentDao;

	@Override
	public int totalComment(int bno) {
		return commentDao.totalComment(bno);
	}

	@Override
	public List<Comment> commentList(int bno) {
		return commentDao.commentList(bno);
	}

	@Override
	public int commentDelete(int no) {
		return commentDao.commentDelete(no);
	}

	@Override
	public void commentInsert(Comment comment) {
		commentDao.commentInsert(comment);
	}
		
}
