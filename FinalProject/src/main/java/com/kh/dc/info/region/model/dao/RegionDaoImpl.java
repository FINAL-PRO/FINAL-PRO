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
		return sqlSession.selectList("region.selectList");
	}
	
	@Override
	public int insertRegion(Region rg) {
		return sqlSession.insert("region.insertRegion", rg);
	}

	@Override
	public Region selectRegion(int no) {
		System.out.println("Dao No : " + no);
		return sqlSession.selectOne("region.selectOne", no);
	}

	@Override
	public int updateRegion(Region rg) {
		return sqlSession.update("region.updateRegion", rg);
	}

	@Override
	public int deleteRegion(int no) {
		return sqlSession.update("region.deleteRegion", no);
	}

	@Override
	public int reInsertRegion(RegionRe rre) {
		return sqlSession.insert("regionRe.insertRegionRe", rre);
	}
}

