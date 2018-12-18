package com.kh.dc.admin.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminMemberController {

	@RequestMapping("admin/member/list.do")
	public String memberList() {
		return "admin/member/list";
	}
}
