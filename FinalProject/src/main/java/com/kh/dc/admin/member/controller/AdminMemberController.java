package com.kh.dc.admin.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.dc.admin.member.model.service.AdminMemberService;
import com.kh.dc.admin.member.model.vo.Member;

@Controller
public class AdminMemberController {
	
	@Autowired
	AdminMemberService memberService;

	@RequestMapping("admin/member/list.do")
	public String memberList(Model model) {
		
		List<Member> memberList = memberService.selectMemberList();
		
		System.out.println("어드민 멤버 리스트" + memberList);
		model.addAttribute("memberList", memberList);
		
		
		return "admin/member/list";
	}
}
