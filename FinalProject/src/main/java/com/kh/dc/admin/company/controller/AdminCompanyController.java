package com.kh.dc.admin.company.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dc.admin.company.model.service.AdminCompanyService;
import com.kh.dc.common.vo.Code;
import com.kh.dc.common.vo.Company;

@Controller
public class AdminCompanyController {
	
	@Autowired
	AdminCompanyService companyService;
	
	@RequestMapping("admin/company/list.do")
	public String companyList(
			@RequestParam(value="companyType", defaultValue="COMTYPE001") String companyType,
			Model model) {
		List<Company> companyList = companyService.selectCompanyList(companyType);
		
		List<Code> compayTypeList = companyService.selectCompanyTypeList();
		
		System.out.println("어드민 컴퍼니  리스트 : " + companyList);
		model.addAttribute("companyList", companyList);
		model.addAttribute("companyTypeList", compayTypeList);
		model.addAttribute("companyType", companyType);
		
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
