package com.kh.dc.admin.company.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.common.vo.Code;
import com.kh.dc.common.vo.Company;

@Repository
public class AdminCompanyDaoImpl implements AdminCompanyDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Company> selectCompanyList(String companyType) {
		return sqlSession.selectList("admin_mapper.selectCompanyList", companyType);
	}

	@Override
	public Company selectCompanyOne(int companyNo) {
		return sqlSession.selectOne("admin_mapper.selectCompanyOne", companyNo);
	}

	@Override
	public List<Code> selectCompanyTypeList() {
		return sqlSession.selectList("admin_mapper.selectCompanyTypeList");
	}

}
