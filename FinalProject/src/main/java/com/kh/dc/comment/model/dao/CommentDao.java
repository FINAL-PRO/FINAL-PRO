package com.kh.dc.comment.model.dao;

import java.util.List;

import com.kh.dc.common.vo.Comment;

public interface CommentDao {
	
	int totalComment(int bno);

	List<Comment> commentList(int bno);

	int commentDelete(int cno);

	int commentInsert(Comment comment);

	int commentUpdate(Comment comment);
	
}
