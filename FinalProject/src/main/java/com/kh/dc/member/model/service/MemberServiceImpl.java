package com.kh.dc.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.member.model.dao.MemberDao;
import com.kh.dc.member.model.vo.Location;
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
	public Member selectOne(String email) {
		return memberDao.selectOne(email);
	}

	@Override
	public int updateMember(Member member) {
		return memberDao.updateMember(member);
	}

	@Override
	public int deleteMember(String email) {
		return memberDao.deleteMember(email);
	}

	@Override
	public int checkEmailDuplicate(String email) {

		return memberDao.checkEmailDuplicate(email);
	}

	@Override
	public int checkNickNameDuplicate(String nickName) {
		
		return memberDao.checkNickNameDuplicate(nickName);
	}

	@Override
	public List<Location> selectLocationList() {
		return memberDao.selectLocationList();
	}

	@Override
	public Member selectOneNickName(String nickName) {
		return memberDao.selectOneNickName(nickName);
	}

	

}
