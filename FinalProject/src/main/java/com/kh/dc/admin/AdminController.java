package com.kh.dc.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dc.member.model.vo.Member;

@Controller
public class AdminController {
	
	@RequestMapping("admin/index.do")
	public String Admin() {
		
		return "admin/index";
	}
}
