package com.kh.dc.admin;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping("admin/index.do")
	public String Admin() {
		
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("로그인된 사용자 : " +  user.getUsername());
		System.out.println("로그인된 사용자 USER: " +  user);
		
		return "admin/index";
	}
}
