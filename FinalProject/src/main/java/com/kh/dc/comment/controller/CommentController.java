package com.kh.dc.comment.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dc.comment.model.service.CommentService;
import com.kh.dc.common.vo.Comment;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;

	
	@RequestMapping(value="comment/commentList.do")
	@ResponseBody
	public List<Comment> commentList(Model model, @RequestParam int bno){

        System.out.println("댓글 리스트!");
        
        int totalComment = commentService.totalComment(bno);
        
        System.out.println("댓글 총 갯수:"+totalComment);
        
        model.addAttribute("totalComment", totalComment);
        
        return commentService.commentList(bno);

    }
	
	public int totalComment(@RequestParam int bno, Model model) {
		
		int totalComment = commentService.totalComment(bno);
		
		System.out.println("totalComment: "+totalComment);
		
		return totalComment;
		
	}

    @RequestMapping("comment/commentWrite.do")
    @ResponseBody
    private int commentInsert(@RequestParam int bno, @RequestParam String content, @RequestParam int mno) throws Exception{
        Comment comment = new Comment();
        comment.setBoardNo(bno);
        comment.setContent(content);
        comment.setMemberNo(mno);
        System.out.println("comment : "+ comment);
        return commentService.commentInsert(comment, bno);
    }

	@RequestMapping(value="comment/commentDelete.do", method=RequestMethod.POST)
	@ResponseBody
	public int commentDelete(@RequestParam int cno) {
		System.out.println("삭제");
		System.out.println("삭제 컨트롤러 cno:"+cno);
		return commentService.commentDelete(cno);
	}
	
	@RequestMapping(value="comment/commentUpdate.do")
	@ResponseBody
	public int commentUpdate(@RequestParam int cno, @RequestParam String content) {
		
		Comment comment = new Comment();
		comment.setNo(cno);
		comment.setContent(content);
		
		System.out.println("수정 컨트롤러 cno:"+cno);
		System.out.println("수정 컨트롤러 content:"+content);
		
		return commentService.commentUpdate(comment);
	}
	
}
