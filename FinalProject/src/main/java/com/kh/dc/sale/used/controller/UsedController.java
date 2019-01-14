package com.kh.dc.sale.used.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dc.common.util.Utils;
import com.kh.dc.sale.used.model.service.UsedService;
import com.kh.dc.sale.used.model.vo.Used;

@Controller
public class UsedController {

	@Autowired
	private UsedService usedService;

	@RequestMapping("sale/used/list.do")
	public String selectUsedList(Model model, 
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage) {
		
		int numPerPage = 10; // 한 페이지당 게시글 수
		
		// 1. 현재 페이지 게시글 목록 가져오기
		ArrayList<Map<String, String>> list = 
				new ArrayList<Map<String, String>>(usedService.selectUsedList(cPage, numPerPage));
		
		// 2. 전체 게시글 개수 가져오기
		int totalContents = usedService.selectUsedTotalContents();
		
		// 3. 페이지 계산 후 작성할 HTML 추가
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "list.do");
		
		model.addAttribute("list", list)
			.addAttribute("totalContents", totalContents)
			.addAttribute("numPerPage", numPerPage)
			.addAttribute("pageBar", pageBar);
		
		return "sale/used/usedList";
	}

	@RequestMapping("sale/used/usedView.do")
	public String selectOneUsed(@RequestParam int boardNo, Model model) {
		
		Used used = usedService.selectOneUsed(boardNo);
		
		System.out.println("uh,, : " + usedService.selectOneUsedHistory(used.getNo()));
		
		model.addAttribute("used", used)
			 .addAttribute("uh", usedService.selectOneUsedHistory(used.getNo()))
			 .addAttribute("statusList", usedService.selectStatusList());
		
		return "sale/used/usedView";
	}

	@RequestMapping("sale/used/usedForm.do")
	public String insertUsedForm(Model model) {
		
		return "sale/used/usedInsert";
	}
	
	@RequestMapping("sale/used/usedFormEnd.do")
	public String insertUsed(Used used, Model model) {
		
		System.out.println("used,,,, : " + used);
		
		if(usedService.insertUsed(used) > 0) {
			model.addAttribute("used", usedService.selectOneUsed(used.getBoardNo()));
		}
		
		return "sale/used/usedView";
	}
	
	@RequestMapping("sale/used/usedUpdateForm.do")
	public String updateUsedForm(@RequestParam int boardNo, Model model) {
		
		model.addAttribute("used", usedService.selectOneUsed(boardNo));
		
		return "sale/used/usedUpdate";
	}
	
	@RequestMapping("sale/used/usedUpdateFormEnd.do")
	public String updateUsed(Used used, Model model) {
		
		int result = usedService.updateUsed(used);
		
		System.out.println("글번호.. : " + used.getBoardNo());
		System.out.println("유즈드.. : " + usedService.selectOneUsed(used.getBoardNo()));
		
		model.addAttribute("used", usedService.selectOneUsed(used.getBoardNo()));
		
		return "sale/used/usedView";
	}
	
	@RequestMapping("sale/used/usedDelete.do")
	public String deleteUsed(@RequestParam int boardNo, Model model) {
		
		String loc = "/sale/used/list.do";
		System.out.println("boardNo : "+boardNo);
		String msg = (usedService.deleteUsed(boardNo)>0) ? "게시글을 삭제하였습니다." : "게시글 삭제에 실패하였습니다.";

		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("sale/used/uStatusUpdate.do")
	@ResponseBody
	public String updateStatus(@RequestParam Map<String, String> status) {
		
		return (usedService.updateStatus(status) > 0) ? "success" : "fail";
	}
	
	@RequestMapping("sale/used/uHistoryCheck.do")
	@ResponseBody
	public String selectOneUsedHistroy(@RequestParam int usedNo, Model model) {
		
		return (usedService.selectOneUsedHistory(usedNo) == null) ? "success" : "fail";
	}
	
	@RequestMapping("sale/used/uHistoryInsert.do")
	@ResponseBody
	public String insertUsedHistroy(@RequestParam Map<String, String> uhMap, Model model) {
		
		return (usedService.insertUsedHistory(uhMap)>0) ? "success" : "fail";
	}
	
	
	
	
	
	
	
}
