package com.kh.dc.community.food.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.BoardList;

public interface FoodDao {
	
	int selectFoodTotalContents();
	
	BoardList selectOneFood(int no);

	/*List<Map<String, String>> selectOneFood(int cPage, int numberPage, int no);*/

	int insertBoard(Board board);

	int foodDelete(int bno);

	int foodUpdate(Board board);
	
	int foodViewCount(int bno);

	List<Board> selectFoodListData();

	List<Map<String, String>> recentSort(int cPage, int numberPage);

	List<Map<String, String>> commentSort(int cPage, int numberPage);

	List<Map<String, String>> likeSort(int cPage, int numberPage);
	
}
