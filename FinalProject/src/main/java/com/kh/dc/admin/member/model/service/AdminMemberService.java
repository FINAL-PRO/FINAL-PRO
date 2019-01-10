package com.kh.dc.admin.member.model.service;

import java.util.List;

import com.kh.dc.common.vo.Code;
import com.kh.dc.member.model.vo.Member;


public interface AdminMemberService {
	public List<Member> selectMemberList(int authNo, String memberStatus);

	public Member selectMemberOne(int memberNo);

	public List<String> selectMemberAuthList();

	public Member checkAuthMember(int no);

	public int changeMemberStatus(int memberNo, String status);

	public List<Code> selectMemberStatusList();
}
