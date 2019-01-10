package com.kh.dc.community.food.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.BoardList;
import com.kh.dc.community.food.model.vo.Food;
import com.kh.dc.community.food.model.vo.FoodPoint;

public interface FoodService {
	
	List<Map<String,String>> recentSort(int cPage, int numberPage);
	
	List<Map<String,String>> commentSort(int cPage, int numberPage);
	
	List<Map<String,String>> likeSort(int cPage, int numberPage);
	
	int selectFoodTotalContents();
	
	BoardList selectOneFood(int bno);
	
	int insertFood(Board board, Food food, FoodPoint foodPoint);

	int foodDelete(int bno);

	int foodUpdate(Board board);
	
	int foodViewCount(int bno);

	List<Board> selectFoodListData();
	
}
