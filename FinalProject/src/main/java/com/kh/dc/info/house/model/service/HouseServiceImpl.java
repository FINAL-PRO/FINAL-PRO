package com.kh.dc.info.house.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.common.vo.Code;
import com.kh.dc.info.house.model.dao.HouseDao;
import com.kh.dc.info.house.model.vo.House;

@Repository
public class HouseServiceImpl implements HouseService {
	
	@Autowired
	private HouseDao houseDao;
	
	
	@Override
	public House selectHouse(int no) {
		return houseDao.selectHouse(no);
	}

	@Override
	public int insertHouse(House hs) {
		return houseDao.insertHouse(hs);
	}

	@Override
	public int updateHouse(House hs) {
		return houseDao.updateHouse(hs);
	}

	@Override
	public int deleteHouse(int no) {
		return houseDao.deleteHoust(no);
	}

	@Override
	public List<Code> selectRoomList() {
		return houseDao.selectRoomList();
	}

	@Override
	public List<Code> selectDealList() {
		return houseDao.selectDealList();
	}

	@Override
	public List<House> houseList(Map<String, Object> params) {
		return houseDao.houseList(params);
	}


}
