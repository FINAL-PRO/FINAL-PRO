package com.kh.dc.admin.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.common.vo.Code;
import com.kh.dc.member.model.vo.Member;


@Repository
public class AdminMemberDaoImpl implements AdminMemberDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Member> selectMemberList(int authNo, String memberStatus) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("authNo", authNo);
		map.put("memberStatus", memberStatus);
		
		return sqlSession.selectList("admin_mapper.selectMemberList", map);
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

	@Override
	public List<Code> selectMemberStatusList() {
		return sqlSession.selectList("admin_mapper.selectMemberStatusList");
	}

	@Override
	public int changeMemberStatus(int memberNo, String status) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("status", status);
		
		return sqlSession.update("admin_mapper.changeMemberStatus", map);
	}

}
