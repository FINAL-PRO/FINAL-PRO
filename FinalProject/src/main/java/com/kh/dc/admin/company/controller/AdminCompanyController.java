package com.kh.dc.admin.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.dc.admin.company.model.service.AdminCompanyService;
import com.kh.dc.common.vo.Board;

@Controller
public class AdminCompanyController {
	
	@Autowired
	AdminCompanyService companyService;
	
	@RequestMapping("admin/company/list.do")
	public String companyList(Model model) {
		List<Board> companyList = companyService.selectCompanyList();
		
		System.out.println("어드민 컴퍼니  리스트 : " + companyList);
		model.addAttribute("companyList", companyList);
		
		return "admin/company/list";
	}

}
