/*package com.kh.dc.mypage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.Comment;
import com.kh.dc.member.model.service.MemberService;
import com.kh.dc.member.model.vo.Member;
import com.kh.dc.mypage.model.service.MypageService;

@SessionAttributes(value= {"member"})
@Controller
public class MypageController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MypageService mypageService;
	
	@RequestMapping("/mypage/myContentList.do")
	public String myContentList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Member member, Model model) {
		
		int mNo = member.getNo();
		
		System.out.println("mNo : " + mNo);
		
		List<Board> boardList = memberService.selectMyBoardList(mNo);
		List<Comment> commentList = memberService.selectMyCommentList(mNo);	
		
		System.out.println("boardList : " + boardList);
		System.out.println("commentList : " + commentList);		
		
		int numPerPage = 10; // 한 페이지당 게시글 수
		
		// 1. 현재 페이지 게시글 목록 가져오기
		ArrayList<Map<String, String>> list = 
				new ArrayList<Map<String, String>>(mypageService.selectGroupList(cPage, numPerPage));
		
		// 2. 전체 게시글 개수 가져오기
		int totalContents = mypageService.selectGroupTotalContents();
		
		// 3. 페이지 계산 후 작성할 HTML 추가
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "myContentList.do");		
		
		model.addAttribute("list", list)
		.addAttribute("totalContents", totalContents)
		.addAttribute("numPerPage", numPerPage)
		.addAttribute("pageBar", pageBar);		
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("commentList", commentList);
		
		
		return "mypage/myContentList";
	}

}
*/