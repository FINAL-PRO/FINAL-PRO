package com.kh.dc.community.food.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.BoardList;
import com.kh.dc.community.food.model.dao.FoodDao;

@Service
public class FoodServiceImpl implements FoodService{

	@Autowired
	FoodDao foodDao;

	@Override
	public int selectFoodTotalContents() {
		return foodDao.selectFoodTotalContents();
	}

	@Override
	public BoardList selectOneFood(int bno) {
		return foodDao.selectOneFood(bno);
	}

	@Override
	public int insertFood(Board board) {
		return foodDao.insertBoard(board);
	}

	@Override
	public int foodDelete(int bno) {
		return foodDao.foodDelete(bno);
	}

	@Override
	public int foodUpdate(Board board) {
		return foodDao.foodUpdate(board);
	}

	@Override
	public int foodViewCount(int bno) {
		return foodDao.foodViewCount(bno);

	}

	@Override
	public List<Board> selectFoodListData() {
		return foodDao.selectFoodListData();
	}

	@Override
	public List<Map<String, String>> recentSort(int cPage, int numberPage) {
		return foodDao.recentSort(cPage, numberPage);
	}

	@Override
	public List<Map<String, String>> commentSort(int cPage, int numberPage) {
		return foodDao.commentSort(cPage, numberPage);
	}

	@Override
	public List<Map<String, String>> likeSort(int cPage, int numberPage) {
		return foodDao.likeSort(cPage, numberPage);
	}

	
}
