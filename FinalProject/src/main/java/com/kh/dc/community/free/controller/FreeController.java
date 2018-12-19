package com.kh.dc.community.free.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FreeController {
	
	@RequestMapping("community/free/list.do")
	public String freeList() {
		return "community/free/list";
	}
	
	@RequestMapping("community/free/freeInsertForm.do")
	public String freeInsertForm() {
		return "community/free/freeInsertForm";
	}
	
	@RequestMapping("community/free/freeDetail.do")
	public String freeDetail() {
		return "community/free/freeDetail";
	}
	
}
