package com.kh.dc.comment.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.Comment;
import com.kh.dc.community.free.model.dao.FreeDao;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	FreeDao CommentDao;

	@Override
	public int commentInsert(Comment comment) {
		return CommentDao.commentInsert(comment);
	}

	@Override
	public int totalComment(int no) {
		return CommentDao.totalComment(no);
	}

	@Override
	public List<Comment> commentList(int no) {
		return CommentDao.commentList(no);
	}

	@Override
	public int commentDelete(int no) {
		return CommentDao.commentDelete(no);
	}
	
}
