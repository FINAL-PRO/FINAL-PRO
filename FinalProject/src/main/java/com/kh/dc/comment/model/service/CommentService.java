package com.kh.dc.comment.model.service;

import java.util.List;

import com.kh.dc.common.vo.Comment;

public interface CommentService {
	
	List<Comment> commentList(int bno);
	
	int totalComment(int bno);

	int commentDelete(int cno);

	int commentInsert(Comment comment);

	int commentUpdate(Comment comment);
	
}
