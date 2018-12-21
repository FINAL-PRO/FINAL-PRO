package com.kh.dc.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.dc.member.model.service.MemberService;
import com.kh.dc.member.model.vo.Location;
import com.kh.dc.member.model.vo.Member;

@SessionAttributes(value= {"member"})
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
	public String memberEnrollEnd(HttpSession session, Member member, Model model) {
		
		System.out.println("member : " + member);

		// 원래 비밀번호
		String rawPassword = member.getPassword();
		System.out.println("비밀번호 암호화 전 : " +rawPassword);		

		member.setPassword(bcryptPasswordEncoder.encode(rawPassword));

		
		System.out.println("비밀번호 암호화 후 : "+member.getPassword());
		
		int result = memberService.insertMember(member);
		
		if(result > 0) {
			session.invalidate();
			return "redirect:/";
		}
		else return "common/error";

	}
	
	@RequestMapping("member/memberLogin.do")
	@ResponseBody
	public Map<String,Object> memberLogin(@RequestParam String email, @RequestParam String password, 
			Model model) {
		Map<String, Object> hmap = new HashMap<>();
		Member m = memberService.selectOne(email);
		System.out.println("member : " +  m);
		
		String msg = "";
		
		if( m == null) {
			msg = "존재하지 않는 회원입니다.";
		} else {
			
			if(bcryptPasswordEncoder.matches(password, m.getPassword())) {
				
				msg = m.getNickName() + "님 환영합니다.";
				model.addAttribute("member", m);
				
			} else {
				msg = "비밀번호가 틀렸습니다!";
			}
		}
		
		hmap.put("msg", msg);
		
		return hmap;
	}
	
	@RequestMapping("/member/memberLogout.do")
	public String memberLogout(SessionStatus sessionStatus,
			HttpSession session, Model model) {
		
		if( !sessionStatus.isComplete()) sessionStatus.setComplete();
		
		String msg= "로그아웃 성공";
		
		model.addAttribute("msg", msg);
		
		return "redirect:/";
	}
	
	@RequestMapping("/member/memberSearch.do")
	public void memberSearch() {}
	

	
	
	
	


}
