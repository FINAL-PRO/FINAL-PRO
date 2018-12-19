package com.kh.dc.info.region.model.service;

import java.util.List;

import com.kh.dc.info.region.model.vo.Region;

public interface RegionService {
	public List<Region> regionList();
	public int insertRegion(Region rg);
	public Region selectRegion(int no);
	public int updateRegion(Region rg);
	public int deleteRegion(int no);
	
}
