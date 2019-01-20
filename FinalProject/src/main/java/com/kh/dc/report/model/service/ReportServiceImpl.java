package com.kh.dc.report.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.common.vo.Report;
import com.kh.dc.report.model.dao.ReportDao;

@Service
public class ReportServiceImpl implements ReportService{
	
	@Autowired
	ReportDao reportDao;

	@Override
	public int reportInsert(Report report) {
		return reportDao.reportInsert(report);
	}

}
