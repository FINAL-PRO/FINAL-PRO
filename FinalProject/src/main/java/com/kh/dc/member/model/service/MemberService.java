package com.kh.dc.member.model.service;

import java.util.List;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.Code;
import com.kh.dc.common.vo.Comment;
import com.kh.dc.common.vo.Location;
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

	List<Code> selectBankList();

	List<Board> selectMyBoardList(int no);

	List<Comment> selectMyCommentList(int no);

}
