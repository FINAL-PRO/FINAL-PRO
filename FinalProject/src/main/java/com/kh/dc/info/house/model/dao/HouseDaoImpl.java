package com.kh.dc.info.house.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.common.vo.Code;
import com.kh.dc.info.house.model.vo.House;

@Repository
public class HouseDaoImpl implements HouseDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	
	@Override
	public House selectHouse(int no) {
		return sqlSession.selectOne("house_mapper.selectOne", no);
	}

	@Override
	public List<House> houseList() {
		return sqlSession.selectList("house_mapper.selectList");
	}

	@Override
	public int insertHouse(House hs) {
		return sqlSession.insert("house_mapper.insertHouse", hs);
	}

	@Override
	public int updateHouse(House hs) {
		return sqlSession.update("house_mapper.updateHouse", hs);
	}

	@Override
	public int deleteHoust(int no) {
		return sqlSession.update("house_mapper.deleteHouse", no);
	}

	@Override
	public List<Code> selectRoomList() {
		return sqlSession.selectList("house_mapper.selectRoomList");
	}

	@Override
	public List<Code> selectDealList() {
		return sqlSession.selectList("house_mapper.selectDealList");
	}



}
