package com.kh.dc.comment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
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
	public @ResponseBody ResponseEntity<List<Comment>> commentList(@RequestParam int bno){
        //ResponseEntity 쓰면 list는물론 HttpStatus(접속 상태)도 같이 보낼 수 있다.
        ResponseEntity<List<Comment>> entity = null;
        try{
        	List<Comment> clist = commentService.commentList(bno);
        	entity = new ResponseEntity<List<Comment>>(clist, HttpStatus.OK);
        }catch(Exception e){
            entity = new ResponseEntity<List<Comment>>(HttpStatus.BAD_REQUEST);
        }
        return entity;
    }
	
	@RequestMapping(value="comment/commentWrite.do", method=RequestMethod.POST)
	public ResponseEntity<String> commentInsert(@RequestBody Comment comment) {
		
		ResponseEntity<String> entity = null;
	
		try{
			commentService.commentInsert(comment);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
/*	public String commentInsert(Comment comment, @RequestParam int bno, HttpSession session) {
		
		int result = commentService.commentInsert(comment);
		
		System.out.println("comment insert 결과: "+result);
		
		return "community/free/freeView";
	}*/
	
/*	@RequestMapping("community/free/commentDelete.do?no={no}")
	public String commentDelete(@RequestParam int no, HttpSession session) {
		
		int result = commentService.commentDelete(no);
		
		System.out.println("comment delete 결과: "+result);
		
		return "community/free/freeView";
	}*/
	
}
