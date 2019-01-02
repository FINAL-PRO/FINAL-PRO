package com.kh.dc.like.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.Like;
import com.kh.dc.like.model.service.LikeService;

@Controller
public class LikeController {
	
	@Autowired
	private LikeService likeService;
	
//	@ResponseBody
//	@RequestMapping(value="/like/likecheck.do", method=RequestMethod.GET)
//	public String like(int bno) {
//				
////		int mno = (Integer)session.getAttribute("mno");
//		JSONObject obj = new JSONObject();
//		
//		ArrayList<String> msgs = new ArrayList<String>();
//		
//		HashMap<String, Object> hmap = new HashMap<String, Object>();
//		hmap.put("bno", bno);
//		
//		Like like = new Like();
//		Board board = new Board();
//		
//		int likecount = LikeService.likecount(bno);
//		int like_check = 0;
//		
//		System.out.println("좋아요 갯수:"+likecount);
//		
//		if(LikeService.like_check(bno) == 0) {			
//			msgs.add("좋아요");
//			LikeService.like_check(hmap);
//			like_check++;
//			likecount++;
//		} else {
//			msgs.add("좋아요 취소");
//			LikeService.like_uncheck(hmap);
//			like_check--;
//			likecount--;
//		}
//		
//		obj.put("bno", bno);
//		obj.put("like_check", like_check);
//		obj.put("likecount", likecount);
//		obj.put("msg", msgs);
//		
//		return obj.toJSONString();
//		
//	}
	
	@ResponseBody
	@RequestMapping(value="/like/liketotal.do")
	public int likeCount(@RequestParam int bno) {
		
		return likeService.likecount(bno);
		
	}
	
	@RequestMapping("like/likecheck.do")
	@ResponseBody
	public int likecheck(@RequestParam int bno, @RequestParam int mno) {

		Like like = new Like();
		like.setBoardNo(bno);
		like.setMemberNo(mno);

		return likeService.likeInsert(like);
	
	}

}
