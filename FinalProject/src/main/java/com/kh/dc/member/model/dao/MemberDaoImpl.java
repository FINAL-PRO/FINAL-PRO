package com.kh.dc.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertMember(Member member) {
		
		return sqlSession.insert("member.insertMember", member);
		
	}

	@Override
	public Member selectOne(String userId) {
		return sqlSession.selectOne("member.loginMember", userId);
	}

	@Override
	public int updateMember(Member member) {
		return sqlSession.update("member.updateMember", member);
	}

	@Override
	public int deleteMember(String userId) {
		return  sqlSession.delete("member.deleteMember", userId);
	}

	@Override
	public int checkEmailDuplicate(String email) {
		
		
		return sqlSession.selectOne("member.checkEmailDuplicate", email);
	}

	@Override
	public int checkNickNameDuplicate(String nickName) {	
		
		return sqlSession.selectOne("member.checkNickNameDuplicate", nickName);
	}



}
