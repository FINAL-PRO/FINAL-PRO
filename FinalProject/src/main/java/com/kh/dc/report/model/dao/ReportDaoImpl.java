package com.kh.dc.report.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.common.vo.Report;

@Repository
public class ReportDaoImpl implements ReportDao{

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int reportInsert(Report report) {
		return sqlSession.insert("report_mapper.reportInsert", report);
	}
	
	
}
