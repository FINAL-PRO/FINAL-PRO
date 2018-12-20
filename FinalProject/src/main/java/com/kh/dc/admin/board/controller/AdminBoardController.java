package com.kh.dc.admin.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dc.admin.board.model.service.AdminBoardService;
import com.kh.dc.admin.company.model.vo.Company;
import com.kh.dc.common.vo.Board;

@Controller
public class AdminBoardController {
	
	@Autowired
	AdminBoardService boardService;
	
	@RequestMapping("admin/board/list.do")
	public String boardList(Model model) {
		List<Board> boardList = boardService.selectBoardList();
		
		System.out.println("어드민 보드 리스트 : " + boardList);
		model.addAttribute("boardList", boardList);
		
		return "admin/board/list";
	}
	
	@RequestMapping("admin/board/detailView.do")
	public String companyDetailView(@RequestParam int boardNo, Model model) {
		Board board = boardService.selectBoardOne(boardNo);
		
		System.out.println("어드민 보드 확인 [ 게시글 번호 : " + boardNo + ", 게시글 : " + board);
		
		model.addAttribute("board", board);
		
		return "admin/board/detailView";
	}

}
