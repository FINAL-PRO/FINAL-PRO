package com.kh.dc.community.food.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.BoardList;
import com.kh.dc.common.vo.Code;
import com.kh.dc.community.food.model.vo.Food;
import com.kh.dc.community.food.model.vo.FoodList;
import com.kh.dc.community.food.model.vo.FoodPoint;

@Repository
public class FoodDaoImpl implements FoodDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> recentSort(int cPage, int numberPage, int locationNo) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numberPage, numberPage);
		return sqlSession.selectList("food_mapper.foodrecentSort", locationNo, rowBounds);
	}

	@Override
	public List<Map<String, String>> commentSort(int cPage, int numberPage, int locationNo) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numberPage, numberPage);
		return sqlSession.selectList("food_mapper.foodcommentSort", locationNo, rowBounds);
	}

	@Override
	public List<Map<String, String>> likeSort(int cPage, int numberPage, int locationNo) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numberPage, numberPage);
		return sqlSession.selectList("food_mapper.foodlikeSort", locationNo, rowBounds);
	}
	
	@Override
	public int selectFoodTotalContents(int locationNo) {
		return sqlSession.selectOne("food_mapper.selectFoodTotalContents", locationNo);
	}

	@Override
	public FoodList selectOneFood(int no) {
		return sqlSession.selectOne("food_mapper.selectOneFood", no);
	}

	@Override
	public int insertBoard(Board board) {
		return sqlSession.insert("food_mapper.insertBoard", board);
	}
	
	@Override
	public int insertFood(Food food) {
		return sqlSession.insert("food_mapper.insertFood", food);
	}
	
	@Override
	public int insertFoodPoint(FoodPoint foodPoint) {
		return sqlSession.insert("food_mapper.insertFoodPoint", foodPoint);
	}

	@Override
	public int foodDelete(int bno) {
		return sqlSession.delete("food_mapper.foodDelete", bno);
	}

	@Override
	public int boardUpdate(FoodList foodList) {
		return sqlSession.insert("food_mapper.updateBoard", foodList);
	}

	@Override
	public int foodUpdate(FoodList foodList) {
		return sqlSession.insert("food_mapper.updateFood", foodList);
	}

	@Override
	public int foodPointUpdate(FoodList foodList) {
		return sqlSession.insert("food_mapper.updateFoodPoint", foodList);
	}
	
	@Override
	public int foodViewCount(int bno) {
		return sqlSession.update("food_mapper.foodViewCount", bno);
		
	}
	
	@Override
	public List<Board> selectFoodListData() {
		return sqlSession.selectList("food_mapper.selectFoodListData");
	}


}
