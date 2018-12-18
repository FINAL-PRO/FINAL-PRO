package com.kh.dc.admin.member.model.dao;

import java.util.ArrayList;

import com.kh.dc.admin.member.model.vo.Member;

public interface MemberDao {
	public ArrayList<Member> selectMemberList();
}
