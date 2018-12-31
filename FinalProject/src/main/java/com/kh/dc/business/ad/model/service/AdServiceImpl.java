package com.kh.dc.business.ad.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.business.ad.model.dao.AdDao;
import com.kh.dc.common.vo.Ad;
import com.kh.dc.common.vo.AdLocation;
import com.kh.dc.common.vo.AdPage;
import com.kh.dc.common.vo.AdSection;
import com.kh.dc.common.vo.Code;

@Service
public class AdServiceImpl implements AdService {
	
	@Autowired
	AdDao adDao;
	
	@Override
	public List<Code> selectAdContentList() {
		return adDao.selectAdContentList();
	}

	@Override
	public List<Code> selectAdTypeList() {
		return adDao.selectAdTypeList();
	}

	@Override
	public List<Code> selectAdStatusList() {
		return adDao.selectAdStatusList();
	}

	@Override
	public List<Ad> selectAdList(Map<String, Object> adParams) {
		return adDao.selectAdList(adParams);
	}

	@Override
	public List<AdPage> selectAdPageList() {
		return adDao.selectAdPageList();
	}

	@Override
	public List<AdSection> selectAdSectionList() {
		return adDao.selectAdSectionList();
	}

	@Override
	public List<AdLocation> selectAdLocationList() {
		return adDao.selectAdLocationList();
	}

	@Override
	public int insertAd(Ad ad) {
		return adDao.insertAd(ad);
	}

}
