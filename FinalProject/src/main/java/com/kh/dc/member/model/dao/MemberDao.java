package com.kh.dc.member.model.dao;

import com.kh.dc.member.model.vo.Member;
import java.util.*;

public interface MemberDao {

	int insertMember(Member member);
	
	Member selectOne(String userId);
	
	int updateMember(Member member);
	
	int deleteMember(String userId);
	
	int checkEmailDuplicate(String email);
	
	int checkNickNameDuplicate(String nickName);
}
