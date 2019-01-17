package com.kh.dc.sale.used.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.common.vo.Board;
import com.kh.dc.sale.used.model.dao.UsedDao;
import com.kh.dc.sale.used.model.vo.Used;

@Service
public class UsedServiceImpl implements UsedService {

	@Autowired
	UsedDao usedDao;

	@Override
	public List<Map<String, String>> selectUsedList(int cPage, int numPerPage) {
		
		return usedDao.selectUsedList(cPage, numPerPage);
	}

	@Override
	public int selectUsedTotalContents() {

		return usedDao.selectUsedTotalContents();
	}

	@Override
	public Used selectOneUsed(int boardNo) {

		Used used = usedDao.selectOneUsed(boardNo);
		
		if(used != null) usedDao.updateViewCount(boardNo);
			
		return used;
	}
	
	@Override
	public Used selectOneUsed2(int boardNo) {

		return usedDao.selectOneUsed2(boardNo);
	}

	@Override
	public int insertUsed(Used used) {
		
		return usedDao.insertBoard(used)*usedDao.insertUsed(used);
	}

	@Override
	public int updateUsed(Used used) {
		
		return usedDao.updateBoard(used)*usedDao.updateUsed(used);
	}

	@Override
	public int deleteUsed(int boardNo) {

		return usedDao.deleteUsed(boardNo);
	}

	@Override
	public Map<String, String> selectOneUsedHistory(int usedNo) {

		return usedDao.selectOneUsedHistory(usedNo);
	}

	@Override
	public int insertUsedHistory(Map<String, String> uh) {

		return usedDao.insertUsedHistory(uh);
	}

	@Override
	public List<Map<String, String>> selectStatusList() {
		
		return usedDao.selectStatusList();
	}

	@Override
	public int updateStatus(Map<String, String> status) {

		return usedDao.updateStatus(status);
	}

	@Override
	public int updateUsedHistroy(Map<String, String> uhMap) {

		return usedDao.updateUsedHistroy(uhMap);
	}

	@Override
	public List<Board> selectMainUsedList() {
		return usedDao.selectMainUsedList();
	}
		
}
