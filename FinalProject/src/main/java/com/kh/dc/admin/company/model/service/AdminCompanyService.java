package com.kh.dc.admin.company.model.service;

import java.util.List;

import com.kh.dc.admin.company.model.vo.Company;

public interface AdminCompanyService {
	public List<Company> selectCompanyList();

	public Company selectCompanyOne(int companyNo);
}
