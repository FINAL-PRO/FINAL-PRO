package com.kh.dc.member.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.member.model.dao.MemberDao;
import com.kh.dc.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;

	@Override
	public int insertMember(Member member) {
		
		return memberDao.insertMember(member);
		
	}

	@Override
	public Member selectOne(String userId) {
		return memberDao.selectOne(userId);
	}

	@Override
	public int updateMember(Member member) {
		return memberDao.updateMember(member);
	}

	@Override
	public int deleteMember(String userId) {
		return memberDao.deleteMember(userId);
	}

	@Override
	public int checkEmailDuplicate(String email) {

		return memberDao.checkEmailDuplicate(email);
	}

	@Override
	public int checkNickNameDuplicate(String nickName) {
		
		return memberDao.checkNickNameDuplicate(nickName);
	}

}
