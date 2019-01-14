package com.kh.dc.business.partnership.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.common.vo.Code;
import com.kh.dc.common.vo.Company;

@Repository
public class PartnershipDaoImpl implements PartnershipDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Code> selectCompayTypeList() {
		return sqlSession.selectList("company_mapper.selectCompayTypeList");
	}

	@Override
	public List<Company> selectCompanyList(String companyType) {
		return sqlSession.selectList("company_mapper.selectCompanyList", companyType);
	}

	@Override
	public Company selectOne(int companyNo) {
		return sqlSession.selectOne("company_mapper.selectCompanyOne", companyNo);
	}

	@Override
	public int insertCompany(Company company) {
		return sqlSession.insert("company_mapper.insertCompany", company);
	}

	@Override
	public int updateCompany(Company company) {
		return sqlSession.update("company_mapper.updateCompany", company);
	}
}
