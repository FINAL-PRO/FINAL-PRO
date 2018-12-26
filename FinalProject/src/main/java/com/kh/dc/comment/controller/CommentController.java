package com.kh.dc.comment.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dc.comment.model.service.CommentService;
import com.kh.dc.common.vo.Comment;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	

	@RequestMapping("community/free/commentList.do")
	public String commentList(@RequestParam int no, Model model) {
	
		int totalComment = commentService.totalComment(no);
		
		System.out.println("totalComment: "+totalComment);

		List<Comment> clist = commentService.commentList(no);
		
		model.addAttribute("totalComment", totalComment)
		.addAttribute("clist", clist);
		

		return "community/free/freeView";
	}
	
	@RequestMapping("community/free/commentWrite.do")
	public String commentInsert(Comment comment, @RequestParam int no, HttpSession session) {
		
		int result = commentService.commentInsert(comment);
		
		System.out.println("comment insert 결과: "+result);
		
		return "community/free/freeView";
	}
	
/*	@RequestMapping("community/free/commentDelete.do?no={no}")
	public String commentDelete(@RequestParam int no, HttpSession session) {
		
		int result = commentService.commentDelete(no);
		
		System.out.println("comment delete 결과: "+result);
		
		return "community/free/freeView";
	}*/
	
}
