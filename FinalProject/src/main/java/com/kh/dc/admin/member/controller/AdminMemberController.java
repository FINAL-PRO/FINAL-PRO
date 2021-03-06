package com.kh.dc.admin.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dc.admin.member.model.service.AdminMemberService;
import com.kh.dc.common.vo.Code;
import com.kh.dc.member.model.vo.Member;

@Controller
public class AdminMemberController {
	
	@Autowired
	AdminMemberService memberService;

	@RequestMapping("admin/member/list.do")
	public String memberList(
			@RequestParam(value="authNo", defaultValue="1", required=false) int authNo,
			@RequestParam(value="memberStatus", defaultValue="MSTATUS001", required=false) String memberStatus,
			Model model) {
		
		System.out.println("선택한 권한 번호 : " + authNo);
		
		List<Member> memberList = memberService.selectMemberList(authNo, memberStatus);
		
		// 멤버 권한 리스트
		List<String> memberAuthList = memberService.selectMemberAuthList();
		List<Code> memberStatusList = memberService.selectMemberStatusList();
		
		System.out.println("어드민 멤버 리스트" + memberList);
		model.addAttribute("memberList", memberList);
		model.addAttribute("authNo", authNo);
		model.addAttribute("memberStatus", memberStatus);
		model.addAttribute("memberAuthList", memberAuthList);
		model.addAttribute("memberStatusList", memberStatusList);
		
		return "admin/member/list";
	}
	
	@RequestMapping("admin/member/detailView.do")
	public String memberDetailView(@RequestParam int memberNo, Model model) {
		Member member = memberService.selectMemberOne(memberNo);
		
		System.out.println("어드민 멤버 확인 [ 게시글 번호 : " + memberNo + ", 게시글 : " + member);
		
		model.addAttribute("member", member);
		
		return "admin/member/detailView";
	}
	
	public Member checkAuthMember(int no) {
		System.out.println("no 검색 : " + no);
		Member member = memberService.checkAuthMember(no); 
		
		return member;
	}
	
	@RequestMapping("admin/member/changeMemberStatus.do")
	@ResponseBody
	public int changeMemberStatus(@RequestParam int memberNo, @RequestParam String status) {
		System.out.println("상태 체크 : " + status + " 멤버번호 : " + memberNo);
		
		int result = memberService.changeMemberStatus(memberNo, status);
		
		return result;
	}
}
