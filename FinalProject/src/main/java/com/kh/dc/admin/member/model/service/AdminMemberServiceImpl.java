package com.kh.dc.admin.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.admin.member.model.dao.AdminMemberDao;
import com.kh.dc.admin.member.model.vo.Member;

@Service
public class AdminMemberServiceImpl implements AdminMemberService{

	@Autowired
	AdminMemberDao memberDao;
	
	@Override
	public List<Member> selectMemberList() {
		return memberDao.selectMemberList();
	}

}
