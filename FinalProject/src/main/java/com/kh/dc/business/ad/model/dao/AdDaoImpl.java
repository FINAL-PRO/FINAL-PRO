package com.kh.dc.business.ad.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.common.vo.Ad;
import com.kh.dc.common.vo.AdLocation;
import com.kh.dc.common.vo.AdPage;
import com.kh.dc.common.vo.AdSection;
import com.kh.dc.common.vo.Code;

@Repository
public class AdDaoImpl implements AdDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Code> selectAdContentList() {
		return sqlSession.selectList("ad_mapper.selectAdContentList");
	}

	@Override
	public List<Code> selectAdTypeList() {
		return sqlSession.selectList("ad_mapper.selectAdTypeList");
	}

	@Override
	public List<Code> selectAdStatusList() {
		return sqlSession.selectList("ad_mapper.selectAdStatusList");
	}

	@Override
	public List<Ad> selectAdList(Map<String, Object> adParams) {
		return sqlSession.selectList("ad_mapper.selectAdList", adParams);
	}

	@Override
	public List<AdPage> selectAdPageList() {
		return sqlSession.selectList("ad_mapper.selectAdPageList");
	}

	@Override
	public List<AdSection> selectAdSectionList() {
		return sqlSession.selectList("ad_mapper.selectAdSectionList");
	}

	@Override
	public List<AdLocation> selectAdLocationList() {
		return sqlSession.selectList("ad_mapper.selectAdLocationList");
	}

	@Override
	public int insertAd(Ad ad) {
		return sqlSession.insert("ad_mapper.insertAd", ad);
	}

	@Override
	public Ad getAd() {
		return sqlSession.selectOne("ad_mapper.getAd");
	}

}
