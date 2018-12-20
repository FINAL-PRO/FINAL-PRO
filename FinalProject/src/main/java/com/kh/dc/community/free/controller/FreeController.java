package com.kh.dc.community.free.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping("community/free/freeInsertForm.do")
	public void freeInsertForm() {
		
	}
	
	
	@RequestMapping(value="community/free/freeInsertFormEnd.do")
	public String insertFree(Board board, Model model, HttpSession session) {
		
		System.out.println("받아온 정보 : " + board);
		
		int result = freeService.insertFree(board);
		System.out.println("insert 결과 : " + result);
		
		String loc = "community/free/list";
		String msg = "";
		
		if(result>0) {
			msg = "게시글 등록 성공!";
			loc = "community/free/list";
		} else {
			msg = "게시물 등록 실패!";
		}
		
		return "community/free/list";
	}
	
	private Object result(int i) {
		// TODO Auto-generated method stub
		return null;
	}

	@RequestMapping("community/free/freeView.do")
	public String selectOneFree(@RequestParam int no, Model model) {
		model.addAttribute("board", freeService.selectOneFree(no));
		
		return "community/free/freeView";
	}
	/*
	@RequestMapping("community/free/freeUpdateForm.do")
	public String freeUpdateForm() {
		return "community/free/freeUpdateForm";
	}
	
	@RequestMapping("community/free/freeUpdate.do")
	public String freeUpdate() {
		return "community/free/freeUpdate";
	}
	
	@RequestMapping("community/free/freeDelete.do")
	public String freeDelete() {
		return "community/ree/freeDelete";
	}*/
	
}
