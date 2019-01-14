package com.kh.dc.business.partnership.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dc.business.partnership.model.service.PartnershipService;
import com.kh.dc.common.vo.Code;
import com.kh.dc.common.vo.Company;

@Controller
public class PartnershipController {
	
	@Autowired
	PartnershipService partnershupService;
	
	@RequestMapping("business/partnership/list.do")
	public String partnershipList(Model model,
			@RequestParam(value="companyType", defaultValue="COMTYPE001") String companyType) {
		
		List<Code> companyTypeList = partnershupService.selectCompayTypeList();
		List<Company> companyList = partnershupService.selectCompanyList(companyType);
		
		model.addAttribute("companyTypeList", companyTypeList);
		model.addAttribute("companyList", companyList);
		model.addAttribute("companyType", companyType);
		
		return "business/partnership/list";
	}
	
	@RequestMapping("business/partnership/view.do")
	public String detailView(Model model,
			@RequestParam int companyNo) {
		
		Company company = partnershupService.selectOne(companyNo);
		
		model.addAttribute("company", company);
		
		return "business/partnership/detailView";
	}
	
	@RequestMapping("business/partnership/insert/view.do")
	public String insertView(Model model) {
		
		List<Code> companyTypeList = partnershupService.selectCompayTypeList();
		
		model.addAttribute("companyTypeList", companyTypeList);
		
		return "business/partnership/insertForm";
	}
	
	@RequestMapping("business/partnership/insert.do")
	public String insertCompany(Model model, Company company) {
		
		System.out.println("company : " + company);
		
		int result = partnershupService.insertCompany(company);
		
		return "redirect:/business/partnership/list.do";
	}
	
	@RequestMapping("business/partnership/update/view.do")
	public String updateView(Model model, 
			@RequestParam int companyNo) {
		
		List<Code> companyTypeList = partnershupService.selectCompayTypeList();
		Company company = partnershupService.selectOne(companyNo);
		
		model.addAttribute("companyTypeList", companyTypeList);
		model.addAttribute("company", company);
		
		return "business/partnership/insertForm";
	}
	
	@RequestMapping("business/partnership/update.do")
	public String updateCompany(Model model, Company company,
			@RequestParam int companyNo) {
		
		System.out.println("업데이트 company : " + company);
		
		company.setNo(companyNo);
		
		int result = partnershupService.updateCompany(company);
		
		return "redirect:/business/partnership/list.do";
	}
}
