package com.kh.dc.comment.model.dao;

import java.util.List;

import com.kh.dc.common.vo.Comment;

public interface CommentDao {

//	String commentInsert(Comment comment);
	
	int totalComment(int no);

	List<Comment> commentList(int bno);

	int commentDelete(int cno);

	void commentInsert(Comment comment);

	int commentUpdate(Comment comment);

//	List<Comment> commentList();
	
//	ArrayList<Comment> commentList(int bno);
	
}
