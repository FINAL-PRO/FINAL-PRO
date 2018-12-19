package com.kh.dc.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dc.member.model.service.MemberService;
import com.kh.dc.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll() {
		
		return "member/memberEnroll";
		
	}
	
	@RequestMapping("member/memberEnrollEnd.do")
	public String memberEnrollEnd(Member member, Model model) {

		// 원래 비밀번호
		String rawPassword = member.getPassword();
		System.out.println("비밀번호 암호화 전 : " +rawPassword);		

		member.setPassword(bcryptPasswordEncoder.encode(rawPassword));

		
		System.out.println("비밀번호 암호화 후 : "+member.getPassword());
		
		int result = memberService.insertMember(member);
		
		String loc = "/";
		String msg = "";
		
		if(result > 0) msg = "회원 가입 성공!";
		else msg = "회원 가입 실패!";
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("member/checkNickNameDuplicate.do")
	@ResponseBody
	public int checkNickNameDuplicate(@RequestParam String nickName){		

		int result = memberService.checkNickNameDuplicate(nickName);

		return result;
		
	}
	
	@RequestMapping("member/checkEmailDuplicate.do")
	@ResponseBody
	public int checkEmailDuplicate(@RequestParam String email){		

		int result = memberService.checkEmailDuplicate(email);

		return result;
		
	}
	
	

}
