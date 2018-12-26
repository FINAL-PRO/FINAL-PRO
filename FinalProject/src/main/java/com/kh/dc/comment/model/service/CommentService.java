package com.kh.dc.comment.model.service;

import java.util.List;

import com.kh.dc.common.vo.Comment;

public interface CommentService {
	
	List<Comment> commentList(int bno);
	
	/*String commentInsert(Comment comment);*/
	
	int totalComment(int no);


	int commentDelete(int no);

	void commentInsert(Comment comment);

//	ArrayList<Comment> commentList(int bno);

	
}
