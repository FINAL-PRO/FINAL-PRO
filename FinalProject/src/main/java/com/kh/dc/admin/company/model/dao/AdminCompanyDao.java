package com.kh.dc.admin.company.model.dao;

import java.util.List;

import com.kh.dc.admin.company.model.vo.Company;

public interface AdminCompanyDao {
	
	public List<Company> selectCompanyList();

	public Company selectCompanyOne(int companyNo);
}
