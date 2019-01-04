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
		
		System.out.println("어드민 보드 리스트 : " + boardList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardStatus", boardStatus);
		model.addAttribute("boardTypeList", boardTypeList);
		model.addAttribute("boardStatusList", boardStatusList);
		
		return "admin/board/list";
	}
	
	@RequestMapping("admin/board/detailView.do")
	public String boardDetailView(@RequestParam int boardNo, Model model) {
		Board board = boardService.selectBoardOne(boardNo);
		
		System.out.println("어드민 보드 확인 [ 게시글 번호 : " + boardNo + ", 게시글 : " + board);
		
		model.addAttribute("board", board);
		
		return "admin/board/detailView";
	}
	
	@RequestMapping("admin/board/notice/writeView.do")
	public String boardNoticeWriteView(Model model) {
		
		List<Code> boardTypeList = boardService.selectBoardTypeList();
		
		model.addAttribute("boardTypeList", boardTypeList);
		
		return "admin/board/noticeInsertView";
	}
	
	@RequestMapping("admin/board/notice/write.do")
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
