package com.kh.dc.member.model.service;

import java.util.List;

import com.kh.dc.member.model.vo.Location;
import com.kh.dc.member.model.vo.Member;

public interface MemberService {
	
	int insertMember(Member member);
	
	Member selectOne(String email);
	
	int updateMember(Member member);
	
	int deleteMember(int no);
	
	int checkEmailDuplicate(String email);
	
	int checkNickNameDuplicate(String nickName);

	List<Location> selectLocationList();
	
	Member selectOneNickName(String nickName);

}
