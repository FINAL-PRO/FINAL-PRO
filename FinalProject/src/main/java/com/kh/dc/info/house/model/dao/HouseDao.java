package com.kh.dc.info.house.model.dao;

import java.util.List;

import com.kh.dc.info.house.model.vo.House;

public interface HouseDao {

	public House selectHouse(int no);

	public List<House> houseList();

	public int insertHouse(House hs);

	public int updateHouse(House hs);

	public int deleteHoust(int no);

}
