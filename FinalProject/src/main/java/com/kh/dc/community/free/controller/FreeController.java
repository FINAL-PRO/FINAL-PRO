package com.kh.dc.community.free.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dc.community.free.model.service.FreeService;
import com.kh.dc.common.util.Utils;

import com.kh.dc.common.vo.Board;

@Controller
public class FreeController {
	
	@Autowired
	private FreeService freeService;
	
	@RequestMapping("community/free/list.do")
	public String selectFreeList(@RequestParam(value="cPage", required=false, defaultValue="1")
	int cPage, Model model) {
		
		int numPerPage = 10; // 한 페이지당 게시글 수
		
		// 1. 현재 페이지 게시글 목록 가져오기
		ArrayList<Map<String, String>> list = 
				new ArrayList<Map<String, String>>(freeService.selectFreeList(cPage, numPerPage));
		
		System.out.println("list: "+list);
		
		// 2. 전체 게시글 개수 가져오기
		int totalContents = freeService.selectFreeTotalContents();
		
		// 3. 페이지 계산 후 작성할 HTML 추가
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "list.do");
		
		model.addAttribute("list", list)
		.addAttribute("totalContents", totalContents)
		.addAttribute("numPerPage", numPerPage)
		.addAttribute("pageBar", pageBar);
		
		return "community/free/list";
	}
	
	// freeInsertForm.jsp 매핑
	@RequestMapping("community/free/freeInsertForm.do")
	public void freeInsertForm() {
		
	}
	
	
	@RequestMapping("community/free/freeInsertFormEnd.do")
	public String insertFree(Board board) {
		
		System.out.println("받아온 정보 : " + board);
		
		int result = freeService.insertFree(board);
		System.out.println("insert 결과 : " + result);
		
		return "redirect:/community/free/list.do";
	}

	@RequestMapping("community/free/freeView.do")
	public String selectOneFree(@RequestParam int no, Model model) {
		
		// 조회수 증가
		int freeViewCount = freeService.freeViewCount(no);
		
		model.addAttribute("board", freeService.selectOneFree(no))
		.addAttribute("freeViewCount", freeViewCount);
		
		return "community/free/freeView";
	}
	
	@RequestMapping("community/free/freeUpdateForm.do")
	public String freeUpdateView(Model model, @RequestParam int no) {

		model.addAttribute("board", freeService.selectOneFree(no));
		
		return "community/free/freeUpdateForm";
	}
	
	@RequestMapping("community/free/freeUpdateFormEnd.do")
	public String freeUpdate(Board board) {
		
		freeService.freeUpdate(board);
		System.out.println("수정완료");
		
		return "redirect:/community/free/list.do";
	}
	
	@RequestMapping("community/free/freeDelete.do")
	public String freeDelete(@RequestParam int no) {
		
		System.out.println("삭제:" +no);
		freeService.freeDelete(no);
		
		return "redirect:/community/free/list.do";
	}
	
}
