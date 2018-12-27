package com.kh.dc.info.house.model.service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.kh.dc.common.vo.Code;
import com.kh.dc.info.house.model.vo.House;

public interface HouseService {

	public House selectHouse(int no);
	public List<House> houseList();
	public int insertHouse(House hs);
	public int  updateHouse(House hs);
	public int deleteHouse(int no);
	public List<Code> selectRoomList();
	public List<Code> selectDealList();

}
