package com.kh.dc.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.Code;
import com.kh.dc.common.vo.Comment;
import com.kh.dc.common.vo.Location;
import com.kh.dc.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertMember(Member member) {		
		return sqlSession.insert("member_mapper.insertMember", member);		
	}

	@Override
	public Member selectOne(String email) {
		return sqlSession.selectOne("member_mapper.selectOneMember", email);
	}

	@Override
	public int updateMember(Member member) {
		return sqlSession.update("member_mapper.updateMember", member);
	}

	@Override
	public int deleteMember(int no) {
		System.out.println("회원탈퇴 no : " + no);
		return  sqlSession.update("member_mapper.deleteMember", no);
	}

	@Override
	public int checkEmailDuplicate(String email) {				
		return sqlSession.selectOne("member_mapper.checkEmailDuplicate", email);
	}

	@Override
	public int checkNickNameDuplicate(String nickName) {			
		return sqlSession.selectOne("member_mapper.checkNickNameDuplicate", nickName);
	}

	@Override
	public List<Location> selectLocationList() {		
		return sqlSession.selectList("member_mapper.selectLocationList");
	}

	@Override
	public Member selectOneNickName(String nickName) {
		return sqlSession.selectOne("member_mapper.selectOneNickName", nickName);
	}

	@Override
	public List<Code> selectBankList() {
		return sqlSession.selectList("member_mapper.selectBankList");
	}

	@Override
	public List<Board> selectMyBoardList(int no) {
		return sqlSession.selectList("member_mapper.selectMyBoardList", no);	
	}

	@Override
	public List<Comment> selectMyCommentList(int no) {
		return sqlSession.selectList("member_mapper.selectMyCommentList", no);	
	}


	



}
