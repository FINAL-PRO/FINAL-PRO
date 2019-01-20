package com.kh.dc.info.region.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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
	public int insertRegion(Region region) {
		return sqlSession.insert("region_mapper.insertRegion", region);
	}

	@Override
	public Region selectRegion(int no) {
		return sqlSession.selectOne("region_mapper.selectOne", no);
	}

	@Override
	public int updateRegion(Region region) {
		return sqlSession.update("region_mapper.updateRegion", region);
	}
	
	@Override
	public int deleteRegionLike(int no) {
		return sqlSession.update("region_mapper.deleteRegionLike", no);
	}

	@Override
	public int deleteRegion(int no) {
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

	@Override
	public List<Map<String, String>> regionList(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("region_mapper.selectList",null, rowBounds);
	}

	@Override
	public int selectRegionTotalContents() {
		return sqlSession.selectOne("region_mapper.selectTotalContent");
	}


}

