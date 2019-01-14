package com.kh.dc.business.partnership.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.business.partnership.model.dao.PartnershipDao;
import com.kh.dc.common.vo.Code;
import com.kh.dc.common.vo.Company;

@Service
public class PartnershipServiceImpl implements PartnershipService{

	@Autowired
	PartnershipDao partnershipDao;

	@Override
	public List<Code> selectCompayTypeList() {
		return partnershipDao.selectCompayTypeList();
	}

	@Override
	public List<Company> selectCompanyList(String companyType) {
		return partnershipDao.selectCompanyList(companyType);
	}

	@Override
	public Company selectOne(int companyNo) {
		return partnershipDao.selectOne(companyNo);
	}

	@Override
	public int insertCompany(Company company) {
		return partnershipDao.insertCompany(company);
	}

	@Override
	public int updateCompany(Company company) {
		return partnershipDao.updateCompany(company);
	}
}
