package com.kh.dc.business.ad.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.dc.common.vo.Ad;
import com.kh.dc.common.vo.AdLocation;
import com.kh.dc.common.vo.AdPage;
import com.kh.dc.common.vo.AdSection;
import com.kh.dc.common.vo.Code;

public interface AdDao {

	List<Code> selectAdContentList();

	List<Code> selectAdTypeList();

	List<Code> selectAdStatusList();

	List<Ad> selectAdList(Map<String, Object> adParams);

	List<AdPage> selectAdPageList();

	List<AdSection> selectAdSectionList();

	List<AdLocation> selectAdLocationList();

	int insertAd(Ad ad);

	Ad getAd(Map<String, Object> params);

}
