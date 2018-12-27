package com.kh.dc.job.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dc.job.model.service.JobBoardService;
import com.kh.dc.job.model.vo.JobBoard;
import com.kh.dc.common.util.Utils;

@Controller
public class JobBoardController {
	
	@Autowired
	private JobBoardService jobBoardService;  
	
	@RequestMapping("/job/jobBoard/jobBoardList.do")
	public String jobBoardList(
			@RequestParam(value="cPage", required=false, defaultValue="1")
			int cPage, 
			Model model) {
		
		int numPerPage = 10;
		
		ArrayList<Map<String, String>> list = 
				new  ArrayList<Map<String, String>>(jobBoardService.selectJobBoardList(cPage, numPerPage));
		
		int totalContents = jobBoardService.selectJobBoardTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "jobBoardList.do");
		
		model.addAttribute("list", list)
		.addAttribute("totalContents", totalContents)
		.addAttribute("numPerPage", numPerPage)
		.addAttribute("pageBar", pageBar);
		
		return "job/jobBoard/jobBoardList";
	}
	
	
	@RequestMapping("job/jobBoard/jobBoardForm.do")
	public void boardForm() {
		
	}
	@RequestMapping("job/jobBoard/jobBoardDetail.do")
	public String selectOneBoard(@RequestParam int no, Model model) {
		
		model.addAttribute("jobBoard", jobBoardService.selectOneJobBoard(no));
		
		return "job/jobBoard/jobBoardDetail";
	}
	
	@RequestMapping("job/jobBoard/jobBoardInsertForm.do")
	public void jobBoardInsertForm () {
		
	}
	
	@RequestMapping("job/jobBoard/insertJobBoard.do")
	public String insertJobBoard(JobBoard jobBoard, Model model, HttpSession session) {
		
		int result = jobBoardService.insertJobBoard(jobBoard);
		
		String loc = "/job/jobBoard/jobBoardList.do";
		String msg = "";
		
		if(result > 0) {
			msg = "게시글 등록 성공!";
			loc = "/jobBoard/jobBoardDetail.do?no"+ jobBoard.getNo();
		} else {
			msg = "게시글 등록 실패!";
		}
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/job/jobBoard/jobBoardComPop.do")
	public String jobBoardComPop(
			@RequestParam(value="cPage", required=false, defaultValue="1")
			int cPage, 
			Model model) {
		
		int numPerPage = 5;
		
		ArrayList<Map<String, String>> list = new ArrayList<Map<String, String>>(
				jobBoardService.selectJobBoardComPop(cPage, numPerPage));
		
		int totalContents = jobBoardService.selectJobBoardComPopTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "jobBoardComPop.do");
		
		model.addAttribute("list", list)
		.addAttribute("totalContents", totalContents)
		.addAttribute("numPerPage", numPerPage)
		.addAttribute("pageBar", pageBar);
		
		return "job/jobBoard/jobBoardComPop";
	}
}
