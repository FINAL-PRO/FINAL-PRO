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
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dc.community.free.model.service.FreeService;
import com.kh.dc.sale.group.model.vo.Group;
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
	
	/*
	@RequestMapping("community/free/freeInsertFormEnd.do")
	public String insertFree(Board board) {
		
		System.out.println("받아온 정보 : " + board);
		
		int result = freeService.insertFree(board);
		System.out.println("insert 결과 : " + result);
		
		return "redirect:/community/free/list.do";
	}*/
	
	@RequestMapping("community/free/freeInsertFormEnd.do")
	public String insertFree(Board board,  Model model) {
		
		String loc = "community/free/freeView";
	
		if(freeService.insertFree(board) > 0) {
			model.addAttribute("insertFree", freeService.selectOneFree(board.getNo()));
		}
				
		return loc;
	}
	
	@RequestMapping("community/free/freeView.do")
	public String selectOneFree(@RequestParam int bno, Model model) {
		
		// 조회수 증가
		int freeViewCount = freeService.freeViewCount(bno);
		
		model.addAttribute("board", freeService.selectOneFree(bno))
		.addAttribute("freeViewCount", freeViewCount);
		
		return "community/free/freeView";
	}
	
	@RequestMapping("community/free/freeUpdateForm.do")
	public String freeUpdateView(Model model, @RequestParam int bno) {

		model.addAttribute("board", freeService.selectOneFree(bno));
		
		return "community/free/freeUpdateForm";
	}
	
	@RequestMapping("community/free/freeUpdateFormEnd.do")
	public String freeUpdate(Board board) {
		
		freeService.freeUpdate(board);
		System.out.println("수정완료");
		
		return "redirect:/community/free/list.do";
	}
	
	@RequestMapping("community/free/freeDelete.do")
	public String freeDelete(@RequestParam int bno) {
		
		System.out.println("삭제:" +bno);
		freeService.freeDelete(bno);
		
		return "redirect:/community/free/list.do";
	}
	
	@RequestMapping(value="community/free/getListData.do",produces ="application/text; charset=utf8")
	@ResponseBody
	public String getListData() {
		String result = "";
		
		List<Board> freeList = freeService.selectFreeListData();
		
		System.out.println(freeList);
		
		for (Board board : freeList) {
			result += "<tr><td>";
			result += "<a href='/dc/community/free/freeView.do?no=" + board.getNo() + "'>" + board.getTitle() + "</a>";
			result += "</td></tr>";
		}
		
		return result;
	}
	
}
