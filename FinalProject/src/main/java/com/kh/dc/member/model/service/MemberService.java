package com.kh.dc.member.model.service;

import com.kh.dc.member.model.vo.Member;

public interface MemberService {
	
	int insertMember(Member member);
	
	Member selectOne(String userId);
	
	int updateMember(Member member);
	
	int deleteMember(String userId);
	
	int checkEmailDuplicate(String email);
	
	int checkNickNameDuplicate(String nickName);
}
