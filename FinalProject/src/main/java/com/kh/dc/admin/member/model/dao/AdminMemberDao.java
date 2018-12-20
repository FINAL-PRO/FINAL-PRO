package com.kh.dc.admin.member.model.dao;

import java.util.List;

import com.kh.dc.admin.member.model.vo.Member;

public interface AdminMemberDao {
	public List<Member> selectMemberList();
}
