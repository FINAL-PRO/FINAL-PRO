package com.kh.dc.info.region.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.info.region.model.dao.RegionDao;
import com.kh.dc.info.region.model.vo.Region;
import com.kh.dc.info.region.model.vo.RegionRe;

@Repository
public class RegionserviceImpl implements RegionService {

	@Autowired
	private RegionDao rd;
	
	@Override
	public List<Region> regionList() {
		return rd.regionList();
	}
	
	@Override
	public int insertRegion(Region rg) {
		return rd.insertRegion(rg);
	}

	@Override
	public Region selectRegion(int no) {
		System.out.println("service No : " + no);
		return rd.selectRegion(no);
		
	}

	@Override
	public int updateRegion(Region rg) {
		return rd.updateRegion(rg);
		
	}

	@Override
	public int deleteRegion(int no) {
		return rd.deleteRegion(no); 
		
	}

	@Override
	public int reInsertRegion(RegionRe rre) {
		System.out.println("service rre : " + rre);
		return rd.reInsertRegion(rre);
	}

}
