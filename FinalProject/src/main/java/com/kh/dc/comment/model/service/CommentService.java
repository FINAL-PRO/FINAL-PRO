package com.kh.dc.comment.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.Comment;

public interface CommentService {
	
	int commentInsert(Comment comment);
	
	int totalComment(int no);

	List<Comment> commentList(int no);

	int commentDelete(int no);
	
}
