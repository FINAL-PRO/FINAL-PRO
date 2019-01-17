package com.kh.dc.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dc.common.vo.Report;
import com.kh.dc.report.model.service.ReportService;

@Controller
public class ReportController {

	@Autowired
	private ReportService reportService;
	
	@RequestMapping("/report/reportInsert.do")
	@ResponseBody
	public int reportInsert(@RequestParam int bno, @RequestParam int mno, @RequestParam int reCheck) {
		
		System.out.println("bno report: "+bno);
		
		Report report = new Report();
		report.setBoardNo(bno);
		report.setMemberNo(mno);
		report.setRcNo(reCheck);
		
		int result = reportService.reportInsert(report);
		
		System.out.println("신고: " + result);
		
		return result;
		
	}
	
}
