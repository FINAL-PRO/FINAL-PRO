package com.kh.dc.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dc.member.model.service.MemberService;
import com.kh.dc.member.model.vo.Location;
import com.kh.dc.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll(Model model) {
		List<Location> locationList = memberService.selectLocationList();
		
		System.out.println("로케이션 리스트 : " + locationList);
		model.addAttribute("locationList", locationList);
		
		return "member/memberEnroll";
		
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
	
	@RequestMapping("member/memberEnrollEnd.do")
	public String memberEnrollEnd(Member member, Model model) {
		
		System.out.println("member : " + member);

		// 원래 비밀번호
		String rawPassword = member.getPassword();
		System.out.println("비밀번호 암호화 전 : " +rawPassword);		

		member.setPassword(bcryptPasswordEncoder.encode(rawPassword));

		
		System.out.println("비밀번호 암호화 후 : "+member.getPassword());
		
		int result = memberService.insertMember(member);
		
		if(result > 0) return "redirect:/";
		else return "common/error";

	}
	
	
	
	

}