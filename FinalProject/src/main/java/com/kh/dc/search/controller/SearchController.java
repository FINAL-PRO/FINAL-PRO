package com.kh.dc.search.controller;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
	
	@RequestMapping("/search/list.do")
	public String memberEnroll(@RequestParam String searchWord, Model model) {
		List<Board> searchResultList;
		
		if(!(searchWord.equals(""))) {
		
			searchResultList = searchService.searchResultList(searchWord);				
								
			for(int i = 0; i < searchResultList.size(); i++) {
	
				String resultContent = "";
				String originContent = searchResultList.get(i).getContent();	
				/*System.out.println("#####originContent" + i + " : " + originContent);*/				
				
				if(originContent.contains("<p>")) {
					
					String patterString = "(&lt;img[^>]*src=[\\\"']?([^>\\\"']+)[\\\"']?[^>]*&gt;|<img[^>]*src=[\\\"']?([^>\\\"']+)[\\\"']?[^>]*>|<p>|</p>|<br>|&lt;p&gt;|&lt;/p&gt;)";	
					Pattern pattern = Pattern.compile(patterString);	
					Matcher matcher = pattern.matcher(originContent);
						
					while(matcher.find()) {
						resultContent = matcher.replaceAll("");
					}
				} else {
					resultContent = originContent;
				}
	
				searchResultList.get(i).setContent(resultContent);
				/*System.out.println("#####" + i + " : " + searchResultList.get(i).getContent());	*/	
			}
								
		} else {
			searchResultList = null;
		}
		
		
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("searchResultList", searchResultList);
		
		return "/search/list";
	}
	

}
