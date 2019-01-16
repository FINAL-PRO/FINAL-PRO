package com.kh.dc.info.region.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dc.info.region.model.vo.Region;
import com.kh.dc.info.region.model.vo.RegionRe;

public interface RegionService {
	
	// 게시글
	public List<Map<String, String>> regionList(int cPage, int numPerPage);
	public int insertRegion(Region rg);
	public Region selectRegion(int no);
	public int updateRegion(Region rg);
	public int deleteRegion(int no);
	
	// 댓글
	public int reInsertRegion(RegionRe rre);
	
	// 조회수 증가
	public int updateCountRegion(int no);
	
	// 좋아요
	public int regionLikeCount(int no);
	public int regionLikeCountView(int no);
	
	// 좋아요 삭제
	public int deleteRegionLike(int no);
	public int selectRegionTotalContents();

	
}
