package com.kh.dc.admin.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.admin.member.model.dao.AdminMemberDao;
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
	public List<Member> selectMemberList(int authNo) {
		return memberDao.selectMemberList(authNo);
	}

	@Override
	public Member checkAuthMember(int no) {
		return memberDao.checkAuthMember(no);
	}

}
