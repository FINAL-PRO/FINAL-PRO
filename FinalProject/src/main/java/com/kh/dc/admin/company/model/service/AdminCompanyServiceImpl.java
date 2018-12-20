package com.kh.dc.admin.company.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.admin.company.model.dao.AdminCompanyDao;
import com.kh.dc.common.vo.Company;

@Service
public class AdminCompanyServiceImpl implements AdminCompanyService {

	@Autowired
	AdminCompanyDao companyDao;

	@Override
	public List<Company> selectCompanyList() {
		return companyDao.selectCompanyList();
	}

	@Override
	public Company selectCompanyOne(int companyNo) {
		return companyDao.selectCompanyOne(companyNo);
	}
}
