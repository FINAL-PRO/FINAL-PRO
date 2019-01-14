package com.kh.dc.business.partnership.model.dao;

import java.util.List;

import com.kh.dc.common.vo.Code;
import com.kh.dc.common.vo.Company;

public interface PartnershipDao {

	List<Code> selectCompayTypeList();

	List<Company> selectCompanyList(String companyType);

	Company selectOne(int companyNo);

	int insertCompany(Company company);

	int updateCompany(Company company);

}
