package com.kh.dc.admin.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.admin.member.model.vo.Member;

@Repository
public class AdminMemberDaoImpl implements AdminMemberDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Member> selectMemberList() {
		return sqlSession.selectList("admin_mapper.selectMemberList");
	}

}
