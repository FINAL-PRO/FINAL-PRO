package com.kh.dc.admin.member.model.dao;

import java.util.List;

import com.kh.dc.common.vo.Code;
import com.kh.dc.member.model.vo.Member;


public interface AdminMemberDao {
	public List<Member> selectMemberList(int authNo, String memberStatus);

	public Member selectMemberOne(int memberNo);

	public List<String> selectMemberAuthList();

	public Member checkAuthMember(int no);

	public List<Code> selectMemberStatusList();

	public int changeMemberStatus(int memberNo, String status);
}
