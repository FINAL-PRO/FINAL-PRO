package com.kh.dc.admin.member.model.service;

import java.util.List;

import com.kh.dc.member.model.vo.Member;


public interface AdminMemberService {
	public List<Member> selectMemberList(int authNo);

	public Member selectMemberOne(int memberNo);

	public List<String> selectMemberAuthList();

	public Member checkAuthMember(int no);
}
