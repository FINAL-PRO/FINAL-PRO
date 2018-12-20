package com.kh.dc.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping("admin/index.do")
	public String Admin() {
		return "admin/index";
	}
}
