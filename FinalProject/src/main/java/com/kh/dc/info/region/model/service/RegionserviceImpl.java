package com.kh.dc.info.region.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.info.region.model.dao.RegionDao;
import com.kh.dc.info.region.model.vo.Region;

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

}
