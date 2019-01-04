package com.kh.dc.community.free.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.connector.Request;
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
	public String selectFreeList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, 
			@RequestParam(value="tList", required=false, defaultValue="1") int tList, Model model, HttpServletRequest request) {
		
		int numberPage = 10; // 한 페이지당 게시글 수

		ArrayList<Map<String, String>> list = null;
		
//		String tList1 = request.getParameter("tList");
//		tList = Integer.parseInt(tList1);

		System.out.println("tList:"+tList);
		
		if(tList == 1) {
			list = new ArrayList<Map<String, String>>(freeService.recentSort(cPage, numberPage));
		}else if(tList == 2){
			list = new ArrayList<Map<String, String>>(freeService.commentSort(cPage, numberPage));
		}else if(tList == 3){
			list = new ArrayList<Map<String, String>>(freeService.likeSort(cPage, numberPage));
		}
		
		System.out.println("list: "+list);
		
		// 2. 전체 게시글 개수 가져오기
		int totalContents = freeService.selectFreeTotalContents();
		
		// 3. 페이지 계산 후 작성할 HTML 추가
		String pageBar = Utils.getPageBar(totalContents, cPage, numberPage, "list.do");
		
		
		model.addAttribute("list", list)
		.addAttribute("totalContents", totalContents)
		.addAttribute("numberPage", numberPage)
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
			
		if(freeService.insertFree(board) > 0) {
			model.addAttribute("insertFree", freeService.selectOneFree(board.getNo()));
		}
				
		return "redirect:/community/free/list.do";
	}
	
	@RequestMapping("community/free/freeView.do")
	public String selectOneFree(@RequestParam int bno, Model model) {
		
		System.out.println("bno:"+bno);
		
		// 조회수 증가
		int freeViewCount = freeService.freeViewCount(bno);
		
		model.addAttribute("boardList", freeService.selectOneFree(bno))
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
	
	@RequestMapping("community/free/getListData.do")
	@ResponseBody
	public List<Board> getListData() {
		List<Board> freeList = freeService.selectFreeListData();
		
		return freeList;
	}
	
}
