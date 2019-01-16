package com.kh.dc.community.food.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.BoardList;
import com.kh.dc.common.vo.Code;
import com.kh.dc.community.food.model.vo.Food;
import com.kh.dc.community.food.model.vo.FoodList;
import com.kh.dc.community.food.model.vo.FoodPoint;

public interface FoodDao {
	
	int selectFoodTotalContents();
	
	FoodList selectOneFood(int no);

	int insertBoard(Board board);
	
	int insertFood(Food food);
	
	int insertFoodPoint(FoodPoint foodPoint);

	int foodDelete(int bno);

	int boardUpdate(FoodList foodList);
	
	int foodUpdate(FoodList foodList);
	
	int foodPointUpdate(FoodList foodList);
	
	int foodViewCount(int bno);

	List<Board> selectFoodListData();

	List<Map<String, String>> recentSort(int cPage, int numberPage);

	List<Map<String, String>> commentSort(int cPage, int numberPage);

	List<Map<String, String>> likeSort(int cPage, int numberPage);

	
}
