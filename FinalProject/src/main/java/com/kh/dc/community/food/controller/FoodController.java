package com.kh.dc.community.food.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dc.common.util.Utils;
import com.kh.dc.common.vo.Board;
import com.kh.dc.community.food.model.service.FoodService;
import com.kh.dc.community.food.model.vo.Food;
import com.kh.dc.community.food.model.vo.FoodPoint;

@Controller
public class FoodController {
	
	@Autowired
	private FoodService foodService;
	
/*	@RequestMapping("community/food/list.do")
	public String foodList() {
		return "community/food/list";
	}*/
	
	@RequestMapping("community/food/list.do")
	public String selectFoodList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, 
			@RequestParam(value="tList", required=false, defaultValue="1") int tList, Model model, HttpServletRequest request) {
		
		int numberPage = 10; // 한 페이지당 게시글 수

		ArrayList<Map<String, String>> flist = null;

		System.out.println("tList:"+tList);
		
		if(tList == 1) {
			flist = new ArrayList<Map<String, String>>(foodService.recentSort(cPage, numberPage));
		}else if(tList == 2){
			flist = new ArrayList<Map<String, String>>(foodService.commentSort(cPage, numberPage));
		}else if(tList == 3){
			flist = new ArrayList<Map<String, String>>(foodService.likeSort(cPage, numberPage));
		}
		
		System.out.println("flist: "+flist);
		
		// 2. 전체 게시글 개수 가져오기
		int totalContents = foodService.selectFoodTotalContents();
		
		// 3. 페이지 계산 후 작성할 HTML 추가
		String pageBar = Utils.getPageBar(totalContents, cPage, numberPage, "list.do");
		
		
		model.addAttribute("flist", flist)
		.addAttribute("totalContents", totalContents)
		.addAttribute("numberPage", numberPage)
		.addAttribute("pageBar", pageBar);
		
		return "community/food/list";
	}
	
	// foodInsertForm.jsp 매핑
	@RequestMapping("community/food/foodInsertForm.do")
	public void foodInsertForm() {
		
	}
	
	@RequestMapping("community/food/foodInsertFormEnd.do")
	public String insertFood(Board board, Food food, FoodPoint foodPoint, Model model) {
		if(foodService.insertFood(board, food, foodPoint) > 0) {
			System.out.println("board: "+board);
			System.out.println("food: "+food);
			System.out.println("foodPoint: "+foodPoint);
			
			model.addAttribute("insertFood", foodService.selectOneFood(board.getNo()));
		}
				
		return "redirect:/community/food/list.do";
	}
	
	@RequestMapping("community/food/foodView.do")
	public String selectOneFood(@RequestParam int bno, Model model) {
		
		System.out.println("bno:"+bno);
		
		// 조회수 증가
		int foodViewCount = foodService.foodViewCount(bno);
		
		model.addAttribute("boardList", foodService.selectOneFood(bno))
		.addAttribute("foodViewCount", foodViewCount);
		
		return "community/food/foodView";
	}
	
	@RequestMapping("community/food/foodUpdateForm.do")
	public String foodUpdateView(Model model, @RequestParam int bno) {

		model.addAttribute("board", foodService.selectOneFood(bno));
		
		return "community/food/foodUpdateForm";
	}
	
	@RequestMapping("community/food/foodUpdateFormEnd.do")
	public String foodUpdate(Board board) {
		
		foodService.foodUpdate(board);
		System.out.println("수정완료");
		
		return "redirect:/community/food/list.do";
	}
	
	@RequestMapping("community/food/foodDelete.do")
	public String foodDelete(@RequestParam int bno) {
		
		System.out.println("삭제:" +bno);
		foodService.foodDelete(bno);
		
		return "redirect:/community/food/list.do";
	}
	
	@RequestMapping("community/food/getListData.do")
	@ResponseBody
	public List<Board> getListData() {
		List<Board> foodList = foodService.selectFoodListData();
		
		return foodList;
	}
	
}
