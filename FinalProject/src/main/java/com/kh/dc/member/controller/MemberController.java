package com.kh.dc.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.Code;
import com.kh.dc.common.vo.Comment;
import com.kh.dc.common.vo.Location;
import com.kh.dc.member.model.service.MemberService;
import com.kh.dc.member.model.vo.Member;

@SessionAttributes(value= {"member"})
@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// 회원가입 페이지 가져오기
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll(Model model) {
		List<Location> locationList = memberService.selectLocationList();
		
		System.out.println("로케이션 리스트 : " + locationList);
		model.addAttribute("locationList", locationList);
		
		return "member/memberEnroll";
		
	}
	
	// 회원가입시 닉네임 중복 체크 ajax
	@RequestMapping("member/checkNickNameDuplicate.do")
	@ResponseBody
	public int checkNickNameDuplicate(@RequestParam String nickName){		

		int result = memberService.checkNickNameDuplicate(nickName);

		return result;
		
	}
	
	// 회원가입시 이메일 중복 체크 ajax
	@RequestMapping("member/checkEmailDuplicate.do")
	@ResponseBody
	public int checkEmailDuplicate(@RequestParam String email){		

		int result = memberService.checkEmailDuplicate(email);

		return result;
		
	}
	
	// 회원가입 완료 - memberInsert
	@RequestMapping("member/memberEnrollEnd.do")
	public String memberEnrollEnd(HttpSession session, Member member, 
			Model model, @RequestParam(value="file", required = false) MultipartFile mf) {
		
		System.out.println("member : " + member);
		
		// 1. 파일을 저장할 경로 생성
		String saveDir = session.getServletContext().getRealPath("/resources/upload/profile");
		
		//List<Attachment> attachList = new ArrayList<Attachment>();
		
		// 2. 폴더 유무 확인 후 생성
		File dir = new File(saveDir);
		
		System.out.println("폴더가 있나요? " + dir.exists());
		
		if(dir.exists() == false) dir.mkdirs();
		
		// 3. 파일 업로드 시작 
		
		if(!mf.isEmpty()) {
			// 원본 이름 가져오기
			String originName = mf.getOriginalFilename();
			String ext = originName.substring(originName.lastIndexOf(".")+1);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
			
			int rnNum = (int)(Math.random() * 1000);
			
			// 서버에서 저장 후 관리할 파일 명
			String renamedName = sdf.format(new Date()) + "_" + rnNum + "." + ext;
			
			// 실제 파일을 지정한 파일명으로 변환하며 데이터를 저장한다.
			try {
				mf.transferTo(new File(saveDir + "/" + renamedName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			member.setProfile(renamedName);
			
			System.out.println("프사 서버 저장 완료?" + member.getProfile());
		}
		
		// 비밀번호 암호화 //
		String rawPassword = member.getPassword();	// 원래 비밀번호
		member.setPassword(bcryptPasswordEncoder.encode(rawPassword));
		
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
		
		if(m != null) {		
			if(name.equals(m.getName())) {
				result = 1;
			}				
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
				HtmlEmail sendEmail = new HtmlEmail();
				
				sendEmail.setHostName("smtp.gmail.com"); //SMTP서버 설정
				sendEmail.setSmtpPort(465);  //포트번호
				
				sendEmail.setDebug(true);
				sendEmail.setCharset("euc-kr"); // 한글 인코딩 
				
				sendEmail.setAuthentication("dcPwdMan@gmail.com", "Qwer1234@"); //메일인증 
				sendEmail.setSSLOnConnect(true);			
				
				sendEmail.setFrom("dcPwdMan@gmail.com", "동커");
				
				sendEmail.setSubject("동커 임시 비밀번호 발급"); // 메일 제목
				
				
				StringBuilder sb = new StringBuilder();
				sb.append("<html><body> ");
				sb.append("<p> 임시 비밀번호는 ");
				sb.append(temporaryPwd);
				sb.append("입니다. <br>  로그인 후 반드시 비밀번호를 변경해주세요!</p>");
				sb.append("</body></html>");				

				sendEmail.setHtmlMsg(sb.toString());				
				
				sendEmail.addTo(m.getEmail(), m.getNickName()); // 수신자 추가
				sendEmail.send();
				
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
		List<Code> bankList = memberService.selectBankList();
		
		System.out.println("로케이션 리스트 : " + locationList);
		System.out.println("은행 리스트 : " + bankList);
		
		model.addAttribute("locationList", locationList);
		model.addAttribute("bankList", bankList);
		
		return "member/memberView";
		
	}

	@RequestMapping("/member/memberUpdateView.do")
	public String memberUpdateView(Model model) {
		
		List<Location> locationList = memberService.selectLocationList();
		List<Code> bankList = memberService.selectBankList();
		
		System.out.println("로케이션 리스트 : " + locationList);
		System.out.println("은행 리스트 : " + bankList);
		
		model.addAttribute("locationList", locationList);
		model.addAttribute("bankList", bankList);
		
		return "member/memberUpdate";
		
	}
	
	@RequestMapping("member/memberUpdate.do")
	public String memberUpdate(HttpSession session, Member member, 
				Model model, @RequestParam(value="file", required = false) MultipartFile mf) {
		
		System.out.println("member : " + member);
		
		// 1. 파일을 저장할 경로 생성
		String saveDir = session.getServletContext().getRealPath("/resources/upload/profile");
		
		//List<Attachment> attachList = new ArrayList<Attachment>();
		
		// 2. 폴더 유무 확인 후 생성
		File dir = new File(saveDir);
		
		System.out.println("폴더가 있나요? " + dir.exists());
		
		if(dir.exists() == false) dir.mkdirs();
		
		// 3. 파일 업로드 시작 
		
		if(!mf.isEmpty()) {
			// 원본 이름 가져오기
			String originName = mf.getOriginalFilename();
			String ext = originName.substring(originName.lastIndexOf(".")+1);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
			
			int rnNum = (int)(Math.random() * 1000);
			
			// 서버에서 저장 후 관리할 파일 명
			String renamedName = sdf.format(new Date()) + "_" + rnNum + "." + ext;
			
			// 실제 파일을 지정한 파일명으로 변환하며 데이터를 저장한다.
			try {
				mf.transferTo(new File(saveDir + "/" + renamedName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			member.setProfile(renamedName);
		}
		
		
		String rawPassword = member.getPassword();
		System.out.println("비밀번호 암호화 전 : " +rawPassword);		
		member.setPassword(bcryptPasswordEncoder.encode(rawPassword));		
		System.out.println("비밀번호 암호화 후 : "+member.getPassword());
		
		int result = memberService.updateMember(member);		
		
		if(result > 0) {
			return "redirect:/member/memberView.do";
		}
		else {
			model.addAttribute("msg", "오류가 발생했습니다. 관리자에게 문의해주세요.");			
			return "common/error";
		}		
		
	}

	@RequestMapping("/member/checkPassword.do")
	@ResponseBody
	public int checkPassword(HttpSession session, @RequestParam String email, @RequestParam String password) {
		
		Member m = memberService.selectOne(email);
		
		System.out.println("m : " + m);
			
		if(bcryptPasswordEncoder.matches(password, m.getPassword())) {
			session.invalidate();
			return 1;
		}
		
		else return 0;
	}

	@RequestMapping("/member/memberDelete.do")
	@ResponseBody
	public Map<String, Object> memberDelete(@RequestParam int no) {		
		
		Map<String, Object> hmap = new HashMap<>();
		
		int result = memberService.deleteMember(no);
		
		String msg = "";
		
		if(result > 0) {
			msg = "회원 탈퇴가 성공하였습니다.";			
		} else {
			System.out.println("회원 삭제 실패!");
		}
		
		hmap.put("msg", msg);
		
		return hmap;
		
	}
	
	@RequestMapping("/member/myContentList.do")
	public String myContentList(Member member, Model model) {
		
		int mNo = member.getNo();
		
		System.out.println("mNo : " + mNo);
		
		List<Board> boardList = memberService.selectMyBoardList(mNo);
		List<Comment> commentList = memberService.selectMyCommentList(mNo);	
		
		System.out.println("boardList : " + boardList);
		System.out.println("commentList : " + commentList);		

		model.addAttribute("boardList", boardList);
		model.addAttribute("commentList", commentList);
		
		
		return "mypage/myContentList";
	}
	
	
	

	
	
	
	
	
	
	


}
