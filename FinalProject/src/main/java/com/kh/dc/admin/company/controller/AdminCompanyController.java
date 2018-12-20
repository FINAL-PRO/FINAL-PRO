package com.kh.dc.admin.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dc.admin.company.model.service.AdminCompanyService;
import com.kh.dc.common.vo.Company;

@Controller
public class AdminCompanyController {
	
	@Autowired
	AdminCompanyService companyService;
	
	@RequestMapping("admin/company/list.do")
	public String companyList(Model model) {
		List<Company> companyList = companyService.selectCompanyList();
		
		System.out.println("어드민 컴퍼니  리스트 : " + companyList);
		model.addAttribute("companyList", companyList);
		
		return "admin/company/list";
	}
	
	@RequestMapping("admin/company/detailView.do")
	public String companyDetailView(@RequestParam int companyNo, Model model) {
		Company company = companyService.selectCompanyOne(companyNo);
		
		System.out.println("어드민 컴퍼니 확인 [ 컴퍼니 번호 : " + companyNo + ", 컴퍼니 : " + company);
		
		model.addAttribute("company", company);
		
		return "admin/company/detailView";
	}

}
