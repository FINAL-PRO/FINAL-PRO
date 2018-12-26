package com.kh.dc.info.region.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.info.region.model.vo.Region;
import com.kh.dc.info.region.model.vo.RegionRe;

@Repository
public class RegionDaoImpl implements RegionDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Region> regionList(){
		return sqlSession.selectList("region_mapper.selectList");
	}
	
	@Override
	public int insertRegion(Region rg) {
		return sqlSession.insert("region_mapper.insertRegion", rg);
	}

	@Override
	public Region selectRegion(int no) {
		System.out.println("Dao No : " + no);
		return sqlSession.selectOne("region_mapper.selectOne", no);
	}

	@Override
	public int updateRegion(Region rg) {
		System.out.println("수정 dao rg : " + rg);
		return sqlSession.update("region_mapper.updateRegion", rg);
	}
	
	@Override
	public int deleteRegionLike(int no) {
		System.out.println("deleteLike : " + no);
		return sqlSession.update("region_mapper.deleteRegionLike", no);
	}

	@Override
	public int deleteRegion(int no) {
		System.out.println("deleteRegion : " + no);
		return sqlSession.update("region_mapper.deleteRegion", no);
	}

	@Override
	public int reInsertRegion(RegionRe rre) {
		return sqlSession.insert("regionRe.insertRegionRe", rre);
	}

	@Override
	public int updateCountRegion(int no) {
		return sqlSession.update("region_mapper.updateCountRegion", no);
	}

	@Override
	public int regionLikeCount(int no) {
		return sqlSession.insert("region_mapper.regionLikeCount", no);
	}
	

	@Override
	public int regionLikeCountView(int no) {
		return sqlSession.selectOne("region_mapper.regionLikeCountView", no);
	}


}

