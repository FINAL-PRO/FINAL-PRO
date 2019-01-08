package com.kh.dc.community.notice.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dc.common.vo.Board;
import com.kh.dc.community.notice.model.service.NoticeService;
import com.kh.dc.common.util.Utils;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping("community/notice/list.do")
	public String noticeList() {
		return "community/notice/list";
	}
	
	@RequestMapping("community/food/list.do")
	public String selectFoodList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, 
		Model model, HttpServletRequest request) {
	
		int numberPage = 10; // 한 페이지당 게시글 수

		ArrayList<Map<String, String>> nlist = null;

		nlist = new ArrayList<Map<String, String>>(noticeService.recentSort(cPage, numberPage));

		System.out.println("nlist: "+nlist);
		
		// 2. 전체 게시글 개수 가져오기
		int totalContents = noticeService.selectNoticeTotalContents();
		
		// 3. 페이지 계산 후 작성할 HTML 추가
		String pageBar = Utils.getPageBar(totalContents, cPage, numberPage, "list.do");
		
		model.addAttribute("nlist", nlist)
		.addAttribute("totalContents", totalContents)
		.addAttribute("numberPage", numberPage)
		.addAttribute("pageBar", pageBar);
		
		return "community/notice/list";
	}
	
	// noticeInsertForm.jsp 매핑
	@RequestMapping("community/notice/noticeInsertForm.do")
	public void noticeInsertForm() {
		
	}
	
	@RequestMapping("community/notice/noticeInsertFormEnd.do")
	public String insertNotice(Board board,  Model model) {
		if(noticeService.insertNotice(board) > 0) {
			model.addAttribute("insertNotice", noticeService.selectOneNotice(board.getNo()));
		}
				
		return "redirect:/community/notice/list.do";
	}
	
	@RequestMapping("community/notice/noticeView.do")
	public String selectOneNotice(@RequestParam int bno, Model model) {
		
		System.out.println("bno:"+bno);
		
		// 조회수 증가
		int noticeViewCount = noticeService.noticeViewCount(bno);
		
		model.addAttribute("boardList", noticeService.selectOneNotice(bno))
		.addAttribute("noticeViewCount", noticeViewCount);
		
		return "community/notice/noticeView";
	}
	
	@RequestMapping("community/notice/noticeUpdateForm.do")
	public String noticeUpdateView(Model model, @RequestParam int bno) {

		model.addAttribute("board", noticeService.selectOneNotice(bno));
		
		return "community/notice/noticeUpdateForm";
	}
	
	@RequestMapping("community/notice/noticeUpdateFormEnd.do")
	public String noticeUpdate(Board board) {
		
		noticeService.noticeUpdate(board);
		System.out.println("수정완료");
		
		return "redirect:/community/notice/list.do";
	}
	
	@RequestMapping("community/notice/noticeDelete.do")
	public String noticeDelete(@RequestParam int bno) {
		
		System.out.println("삭제:" +bno);
		noticeService.noticeDelete(bno);
		
		return "redirect:/community/notice/list.do";
		
	}
	
	@RequestMapping("community/notice/getListData.do")
	@ResponseBody
	public List<Board> getListData() {
		List<Board> noticeList = noticeService.selectNoticeListData();
		
		return noticeList;
	}
}
