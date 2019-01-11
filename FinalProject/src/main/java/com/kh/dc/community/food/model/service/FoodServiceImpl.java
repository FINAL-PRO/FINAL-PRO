package com.kh.dc.community.food.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.BoardList;
import com.kh.dc.community.food.model.dao.FoodDao;
import com.kh.dc.community.food.model.vo.Food;
import com.kh.dc.community.food.model.vo.FoodList;
import com.kh.dc.community.food.model.vo.FoodPoint;

@Service
public class FoodServiceImpl implements FoodService{

	@Autowired
	FoodDao foodDao;

	@Override
	public int selectFoodTotalContents() {
		return foodDao.selectFoodTotalContents();
	}

	@Override
	public FoodList selectOneFood(int bno) {
		return foodDao.selectOneFood(bno);
	}

	@Override
	public int insertFood(Board board, Food food, FoodPoint foodPoint) {
		return foodDao.insertBoard(board) * foodDao.insertFood(food) * foodDao.insertFoodPoint(foodPoint) ;
	}
	
/*	@Override
	public int foodUpdate(Board board, Food food, FoodPoint foodPoint) {
		return foodDao.boardUpdate(board) * foodDao.foodUpdate(food) * foodDao.foodPointUpdate(foodPoint);
	}*/

	@Override
	public int foodDelete(int bno) {
		return foodDao.foodDelete(bno);
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

/*	@Override
	public int foodUpdate(Map<String, Object> map) {
		return foodDao.boardUpdate(map);
	}*/

	@Override
	public int foodUpdate(FoodList foodList) {
		return foodDao.foodUpdate(foodList);
	}

	
}
