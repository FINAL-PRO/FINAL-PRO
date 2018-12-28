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
	
/*	@RequestMapping(value="comment/commentList.do")
	public @ResponseBody ResponseEntity<List<Comment>> commentList(@RequestParam int bno){
        //ResponseEntity 쓰면 list는물론 HttpStatus(접속 상태)도 같이 보낼 수 있다.
        ResponseEntity<List<Comment>> entity = null;
        System.out.println("댓글 리스트!");
        try{
        	List<Comment> clist = commentService.commentList(bno);
        	entity = new ResponseEntity<List<Comment>>(clist, HttpStatus.OK);
        }catch(Exception e){
            entity = new ResponseEntity<List<Comment>>(HttpStatus.BAD_REQUEST);
        }
        return entity;
        
    }*/
	
	@RequestMapping(value="comment/commentList.do")
	@ResponseBody
	public List<Comment> commentList(Model model, @RequestParam Integer bno){

        System.out.println("댓글 리스트!");
        
        return commentService.commentList(bno);

    }
	
	@RequestMapping(value="comment/commentWrite.do", method=RequestMethod.POST)
	public ResponseEntity<String> commentInsert(@RequestBody Comment comment, HttpSession session) {
		
		ResponseEntity<String> entity = null;
		System.out.println("댓글입력");
		try{
			String userId = (String)session.getAttribute("userId");
			comment.setMemberName(userId);
			commentService.commentInsert(comment);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
/*	public String commentInsert(Comment comment, @RequestParam int bno, HttpSession session) {
		
		int result = commentService.commentInsert(comment);
		
		System.out.println("comment insert 결과: "+result);
		
		return "community/free/freeView";
	}*/
	
	
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
