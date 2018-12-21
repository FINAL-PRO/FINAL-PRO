package com.kh.dc.info.house.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.info.house.model.dao.HouseDao;
import com.kh.dc.info.house.model.vo.House;

@Repository
public class HouseServiceImpl implements HouseService {
	
	@Autowired
	private HouseDao hd;
	
	
	@Override
	public House selectHouse(int no) {
		return hd.selectHouse(no);
	}

	@Override
	public List<House> houseList() {
		return hd.houseList();
	}

	@Override
	public int insertHouse(House hs) {
		return hd.insertHouse(hs);
	}

	@Override
	public int updateHouse(House hs) {
		return hd.updateHouse(hs);
	}

	@Override
	public int deleteHouse(int no) {
		return hd.deleteHoust(no);
	}

}
