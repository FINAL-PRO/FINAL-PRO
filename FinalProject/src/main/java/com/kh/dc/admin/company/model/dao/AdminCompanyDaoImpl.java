package com.kh.dc.admin.company.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.admin.company.model.vo.Company;
import com.kh.dc.common.vo.Board;

@Repository
public class AdminCompanyDaoImpl implements AdminCompanyDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Company> selectCompanyList() {
		return sqlSession.selectList("admin_mapper.selectCompanyList");
	}

	@Override
	public Company selectCompanyOne(int companyNo) {
		return sqlSession.selectOne("admin_mapper.selectCompanyOne", companyNo);
	}

}
