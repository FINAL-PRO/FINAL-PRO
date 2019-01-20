package com.kh.dc.admin.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dc.admin.board.model.service.AdminBoardService;
import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.Code;

@Controller
public class AdminBoardController {
	
	@Autowired
	AdminBoardService boardService;
	
	@RequestMapping("admin/board/list.do")
	public String boardList(
			@RequestParam(value="boardType", defaultValue="BOARD001", required=false) String boardType,
			@RequestParam(value="boardStatus", defaultValue="BSTATUS001", required=false) String boardStatus,
			Model model) {
		
		List<Board> boardList = boardService.selectBoardList(boardType, boardStatus);
		
		List<Code> boardTypeList = boardService.selectBoardTypeList();
		List<Code> boardStatusList = boardService.selectBoardStatusList();
		
		String boardUrl = null;
		
		switch (boardType) {
			case "BOARD001": boardUrl = "community/free/freeView.do?bno="; break;
			case "BOARD002": boardUrl = "community/food/foodView.do?bno="; break;
			case "BOARD003": boardUrl = "sale/group/view.do?boardNo="; break;
			case "BOARD004": boardUrl = "sale/used/view.do?boardNo="; break;
			case "BOARD005": boardUrl = "info/house/view.do?no="; break;
			case "BOARD006": boardUrl = "job/jobBoard/view.do?no="; break;
			case "BOARD007": boardUrl = "info/region/view.do?no="; break;
			
		}
		
		if(boardStatus.equals("BSTATUS004")) {
			boardUrl = "community/notice/noticeView.do?bno=";
		}
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardStatus", boardStatus);
		model.addAttribute("boardTypeList", boardTypeList);
		model.addAttribute("boardStatusList", boardStatusList);
		model.addAttribute("boardUrl", boardUrl);
		
		return "admin/board/list";
	}
	
	@RequestMapping("admin/board/detailView.do")
	public String boardDetailView(@RequestParam int boardNo, Model model) {
		Board board = boardService.selectBoardOne(boardNo);
		
		model.addAttribute("board", board);
		
		return "admin/board/detailView";
	}
	
	@RequestMapping("admin/board/notice/insert/view.do")
	public String boardNoticeWriteView(Model model) {
		
		List<Code> boardTypeList = boardService.selectBoardTypeList();
		
		model.addAttribute("boardTypeList", boardTypeList);
		
		return "admin/board/noticeInsertView";
	}
	
	@RequestMapping("admin/board/notice/insert.do")
	public String boardNoticeWrite(Board board) {
		
		System.out.println("받아온 정보 : " + board);
		
		int result = boardService.insertNotice(board);
		
		return "redirect:/admin/board/list.do";
	}
	
	@RequestMapping("admin/board/changeBoardStatus.do")
	@ResponseBody
	public int changeBoardStatus(@RequestParam int boardNo, @RequestParam String status) {
		System.out.println("상태 체크 : " + status + " 글번호 : " + boardNo);
		
		int result = boardService.changeBoardStatus(boardNo, status);
		
		return result;
	}
}
