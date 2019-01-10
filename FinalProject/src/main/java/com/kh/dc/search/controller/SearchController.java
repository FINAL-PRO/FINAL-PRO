package com.kh.dc.search.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.dc.common.vo.Board;
import com.kh.dc.search.model.service.SearchService;

@SessionAttributes(value= {"member"})
@Controller
public class SearchController {
	
	@Autowired
	private SearchService searchService;
	
	@RequestMapping("/search/searchView.do")
	public String memberEnroll(@RequestParam String searchWord, Model model) {
		
		List<Board> searchResultList = searchService.searchResultList(searchWord);
	
		model.addAttribute("searchResultList", searchResultList);
		
		return "/search/searchView";
		
	}		

}
