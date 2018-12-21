package com.kh.dc.info.region.model.dao;

import java.util.List;

import com.kh.dc.info.region.model.vo.Region;
import com.kh.dc.info.region.model.vo.RegionRe;

public interface RegionDao {
	public List<Region> regionList();
	public int insertRegion(Region rg);
	public Region selectRegion(int no);
	public int updateRegion(Region rg);
	public int deleteRegion(int no);
	public int reInsertRegion(RegionRe rre);
	public int updateCountRegion(int no);
	public int regionLikeCount(int no);
	public int regionLikeCountView(int no);
}
