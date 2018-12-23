package com.kh.dc.job.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dc.job.model.service.JobBoardService;
import com.kh.dc.common.util.Utils;

@Controller
public class JobBoardController {
	
	@Autowired
	private JobBoardService jobBoardService;  
	
	@RequestMapping("/job/jobBoard/jobBoardList.do")
	public String jobBoardList(
			@RequestParam(value="cPage", required=false, defaultValue="1")
			int cPage, Model model) {
		
		int numPerPage = 20;
		
		ArrayList<Map<String, String>> list = 
				new  ArrayList<Map<String, String>>(jobBoardService.selectJobBoardList(cPage, numPerPage));
		
		int totalContents = jobBoardService.selectJobBoardTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "jobBoardList.do");
		
		model.addAttribute("list", list)
		.addAttribute("totalContents", totalContents)
		.addAttribute("numPerPage", numPerPage)
		.addAttribute("pageBar", pageBar);
		
		return "job/jobBoard/jobBoardlist";
	}
}
