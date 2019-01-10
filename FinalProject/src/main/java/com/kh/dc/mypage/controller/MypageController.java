package com.kh.dc.mypage.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.dc.common.util.Utils;
import com.kh.dc.member.model.vo.Member;
import com.kh.dc.mypage.model.service.MypageService;

@SessionAttributes(value= {"member"})
@Controller
public class MypageController {
	
	/*@Autowired
	private MemberService memberService;*/
	
	@Autowired
	private MypageService mypageService;
	
	@RequestMapping("/mypage/myContentList.do")
	public String myContentList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Member member, Model model) {
		
		int mNo = member.getNo();		
		int numPerPage = 10; // 한 페이지당 게시글 수

		// 내가 쓴 글 페이징
		// 1. 현재 페이지 게시글 목록 가져오기
		ArrayList<Map<String, String>> currentPageBoardlist = 
				new ArrayList<Map<String, String>>(mypageService.selectBoardList(cPage, numPerPage, mNo));
		System.out.println("currentPageBoardlist : " + currentPageBoardlist);
		
		
		// 2. 전체 게시글 개수 가져오기
		int totalBoardContents = mypageService.selectTotalMyBoard(mNo);
		System.out.println("totalBoardContents" + totalBoardContents);
		
		// 3. 페이지 계산 후 작성할 HTML 추가
		String boardPageBar = Utils.getPageBar(totalBoardContents, cPage, numPerPage, "myContentList.do");		
		
		model.addAttribute("currentPageBoardlist", currentPageBoardlist)
		.addAttribute("totalBoardContents", totalBoardContents)
		.addAttribute("boardPageBar", boardPageBar);				
		
		// 내가 쓴 댓글 
		// 1. 현재 페이지 게시글 목록 가져오기
		ArrayList<Map<String, String>> currentPageCommentlist = 
				new ArrayList<Map<String, String>>(mypageService.selectCommentList(cPage, numPerPage, mNo));
		System.out.println("currentPageCommentlist : " + currentPageCommentlist);
		
		
		// 2. 전체 게시글 개수 가져오기
		int totalCommentContents = mypageService.selectTotalMyComment(mNo);
		System.out.println("totalCommentContents" + totalCommentContents);
		
		// 3. 페이지 계산 후 작성할 HTML 추가
		String commentPageBar = Utils.getPageBar(totalCommentContents, cPage, numPerPage, "myContentList.do");		
		
		model.addAttribute("currentPageCommentlist", currentPageCommentlist)
		.addAttribute("totalCommentContents", totalCommentContents)
		.addAttribute("numPerPage", numPerPage)
		.addAttribute("commentPageBar", commentPageBar);		
		
		
		return "mypage/myContentList";
	}

}
