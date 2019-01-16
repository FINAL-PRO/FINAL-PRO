package com.kh.dc.info.region.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.dc.info.region.model.vo.Region;
import com.kh.dc.info.region.model.vo.RegionRe;

public interface RegionDao {
	public int insertRegion(Region rg);
	public Region selectRegion(int no);
	public int updateRegion(Region rg);
	public int deleteRegion(int no);
	public int reInsertRegion(RegionRe rre);
	public int updateCountRegion(int no);
	public int regionLikeCount(int no);
	public int regionLikeCountView(int no);
	public int deleteRegionLike(int no);
	public List<Map<String, String>> regionList(int cPage, int numPerPage);
	public int selectRegionTotalContents();
}
