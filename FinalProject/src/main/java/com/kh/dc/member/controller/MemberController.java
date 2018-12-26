package com.kh.dc.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

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
		Map<String, Object> hmap = new HashMap<String, Object>();
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
	
	@RequestMapping("/member/chkEmail.do")
	@ResponseBody
	public Map<String, Object> chkNickName(@RequestParam String nickName, @RequestParam String name) {
				
		Map<String, Object> hmap = new HashMap<>();
		
		String result = "";	// 닉네임도 틀리면서 이름도 틀린 경우
		
		Member m = memberService.selectOneNickName(nickName);
		System.out.println("m : " + m);
		
		if(m != null) {		
			if(name.equals(m.getName())) result = m.getEmail();										
			else result = "fail2";
						
		} else result = "fail1";
		
		hmap.put("result", result);

		return hmap;
	}
	
	@RequestMapping("/member/chkNickName.do")
	@ResponseBody
	public Map<String, Object> chkNickName(@RequestParam String email){
		Map<String, Object> hmap = new HashMap<>();
		
		String result = "";	// 닉네임도 틀리면서 이름도 틀린 경우
		
		Member m = memberService.selectOne(email);
		System.out.println("m : " + m);
		
		if(m != null) result = m.getName();

		hmap.put("result", result);

		return hmap;
				
	}
	
	// 비밀번호 찾기(이메일, 이름 일치 여부)
	@RequestMapping("/member/chkPwd.do")
	@ResponseBody
	public int chkPwd(@RequestParam String name, @RequestParam String email){
		int result = 0;	
		
		Member m = memberService.selectOne(email);
		System.out.println("m : " + m);
		
		if(name.equals(m.getName())) {
			result = 1;
		}	
		
		System.out.println("result : " + result);
		
		return result;
	}
	
	// 임시 비밀번호 생성 후 이메일 전송
	@RequestMapping("/member/sendPwd.do")
	public void sendPwd(@RequestParam String email) {
		
		System.out.println("sendPwd 들어왔니?");
		Member m = memberService.selectOne(email);
		
		// 임시 비밀번호 생성
		String temporaryPwd = "";
		for (int i = 0; i < 8; i++) {
			int rndVal = (int) (Math.random() * 62);
			if (rndVal < 10) {
				temporaryPwd += rndVal;
			} else if (rndVal > 35) {
				temporaryPwd += (char) (rndVal + 61);
			} else {
				temporaryPwd += (char) (rndVal + 55);
			}
		}
		
		System.out.println("생성된 임시 비밀번호 : " + temporaryPwd);
		
		m.setPassword(bcryptPasswordEncoder.encode(temporaryPwd));
		
		System.out.println("임시 비밀번호 암호화 후 : "+m.getPassword());
		
		if(memberService.updateMember(m) > 0) {
		
			try {
				HtmlEmail mail = new HtmlEmail(); //pom.xml에 commons-email 추가
				
				mail.setDebug(true);
				mail.setCharset("UTF-8"); //한글 인코딩 
				mail.setSSLOnConnect(true);	// SSL 사용
				mail.setHostName("smtp.naver.com"); //host name 
				mail.setSmtpPort(465); // SMTP port number 
				mail.setAuthentication("kimsorwa@naver.com", "Qwer1208@");
				mail.setStartTLSEnabled(true);
				
				mail.addTo(email,m.getNickName()); //받는 사람 
				mail.setFrom("kimsorwa@naver.com","동커"); //보내는 사람 
				mail.setSubject("동커 임시 비밀번호 발송"); //제목 
				mail.setHtmlMsg(m.getNickName() + "님의 임시 비밀번호는 " + temporaryPwd + "입니다. 로그인 후 비밀번호를 변경해주세요. "); //내용 
				mail.send();	
				
			} catch(EmailException e) {
				e.printStackTrace();
			}
			
		} else {
			System.out.println("임시 비밀번호 저장 실패!");
		}
		
	}
	
	@RequestMapping("/member/memberView.do")
	public String memberView(Model model) {
		
		List<Location> locationList = memberService.selectLocationList();
		
		System.out.println("로케이션 리스트 : " + locationList);
		model.addAttribute("locationList", locationList);
		
		return "member/memberView";
		
	}
	
	@RequestMapping("member/memberUpdate.do")
	public String memberUpdate(Member member, Model model) {
		
		System.out.println("member : " + member);
		
		String rawPassword = member.getPassword();
		System.out.println("비밀번호 암호화 전 : " +rawPassword);		
		member.setPassword(bcryptPasswordEncoder.encode(rawPassword));		
		System.out.println("비밀번호 암호화 후 : "+member.getPassword());
		
		int result = memberService.updateMember(member);
		
		model.addAttribute("member", member);
			
		return "redirect:/member/memberView.do";
	}
	
	
	
	
	
	


}
