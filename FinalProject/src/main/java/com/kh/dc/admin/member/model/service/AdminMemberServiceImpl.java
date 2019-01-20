package com.kh.dc.admin.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.admin.member.model.dao.AdminMemberDao;
import com.kh.dc.common.vo.Code;
import com.kh.dc.member.model.vo.Member;

@Service
public class AdminMemberServiceImpl implements AdminMemberService{

	@Autowired
	AdminMemberDao memberDao;

	@Override
	public Member selectMemberOne(int memberNo) {
		return memberDao.selectMemberOne(memberNo);
	}

	@Override
	public List<String> selectMemberAuthList() {
		return memberDao.selectMemberAuthList();
	}

	@Override
	public List<Member> selectMemberList(int authNo, String memberStatus) {
		return memberDao.selectMemberList(authNo, memberStatus);
	}

	@Override
	public Member checkAuthMember(int no) {
		return memberDao.checkAuthMember(no);
	}

	@Override
	public List<Code> selectMemberStatusList() {
		return memberDao.selectMemberStatusList();
	}

	@Override
	public int changeMemberStatus(int memberNo, String status) {
		return memberDao.changeMemberStatus(memberNo, status);
	}

}
