package com.kh.dc.like.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dc.common.vo.Like;
import com.kh.dc.like.model.service.LikeService;

@Controller
public class LikeController {
	
	@Autowired
	private LikeService likeService;

	@RequestMapping("like/likecheck.do")
	@ResponseBody
	public int likecheck(@RequestParam int bno, @RequestParam int mno) {

		Like like = new Like();
		like.setBoardNo(bno);
		like.setMemberNo(mno);
		
		int i = likeService.likeCount(like);
		int result = 0;
		
		System.out.println(mno+"의 댓글 여부: "+i);
		
		if(i == 0) {
			result = likeService.likeInsert(like);
		} else {
			result = likeService.likeDelete(like)*2;
		}

		return result;
	
	}
	
	@RequestMapping("like/likeImages.do")
	@ResponseBody
	public int likeImages(@RequestParam int bno, @RequestParam int mno) {
		
		Like like = new Like();
		like.setBoardNo(bno);
		like.setMemberNo(mno);
		
		int result = likeService.likeCount(like);

		return result;
	}


}
