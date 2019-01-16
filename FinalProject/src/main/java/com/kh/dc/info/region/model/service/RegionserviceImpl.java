package com.kh.dc.info.region.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.info.region.model.dao.RegionDao;
import com.kh.dc.info.region.model.vo.Region;
import com.kh.dc.info.region.model.vo.RegionRe;

@Repository
public class RegionserviceImpl implements RegionService {

	@Autowired
	private RegionDao regionDao;
	
	@Override
	public int insertRegion(Region rg) {
		return regionDao.insertRegion(rg);
	}

	@Override
	public Region selectRegion(int no) {
		System.out.println("service No : " + no);
		return regionDao.selectRegion(no);
		
	}

	@Override
	public int updateRegion(Region rg) {
		return regionDao.updateRegion(rg);
		
	}

	@Override
	public int deleteRegion(int no) {
		return regionDao.deleteRegion(no); 
		
	}

	@Override
	public int reInsertRegion(RegionRe rre) {
		return regionDao.reInsertRegion(rre);
	}

	@Override
	public int updateCountRegion(int no) {
		System.out.println("조회수 증가 svs : " + no);
		return regionDao.updateCountRegion(no);
	}

	@Override
	public int regionLikeCount(int no) {
	
		return regionDao.regionLikeCount(no);
	}

	@Override
	public int regionLikeCountView(int no) {
		return regionDao.regionLikeCountView(no);
	}

	@Override
	public int deleteRegionLike(int no) {
		return regionDao.deleteRegionLike(no);
	}

	@Override
	public List<Map<String, String>> regionList(int cPage, int numPerPage) {
		return regionDao.regionList(cPage, numPerPage);
	}

	@Override
	public int selectRegionTotalContents() {
		return regionDao.selectRegionTotalContents();
	}

}
