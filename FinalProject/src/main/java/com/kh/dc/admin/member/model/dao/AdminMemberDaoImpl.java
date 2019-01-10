package com.kh.dc.admin.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.member.model.vo.Member;


@Repository
public class AdminMemberDaoImpl implements AdminMemberDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Member> selectMemberList(int authNo) {
		return sqlSession.selectList("admin_mapper.selectMemberList", authNo);
	}

	@Override
	public Member selectMemberOne(int memberNo) {
		return sqlSession.selectOne("admin_mapper.selectMemberOne", memberNo);
	}

	@Override
	public List<String> selectMemberAuthList() {
		return sqlSession.selectList("admin_mapper.selectMemberAuthList");
	}

	@Override
	public Member checkAuthMember(int no) {
		return sqlSession.selectOne("admin_mapper.checkAuthMember",no);
	}

}
