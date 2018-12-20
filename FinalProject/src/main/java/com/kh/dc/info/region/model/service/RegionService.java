package com.kh.dc.info.region.model.service;

import java.util.List;

import com.kh.dc.info.region.model.vo.Region;
import com.kh.dc.info.region.model.vo.RegionRe;

public interface RegionService {
	
	// 게시글
	public List<Region> regionList();
	public int insertRegion(Region rg);
	public Region selectRegion(int no);
	public int updateRegion(Region rg);
	public int deleteRegion(int no);
	
	// 댓글
	public int reInsertRegion(RegionRe rre);
	
}