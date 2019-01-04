package com.kh.dc.report.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.report.model.dao.ReportDao;

@Service
public class ReportServiceImpl {
	
	@Autowired
	ReportDao reportdao;

}
