package com.kh.dc.sale.group.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dc.common.util.Utils;
import com.kh.dc.sale.group.model.service.GroupService;
import com.kh.dc.sale.group.model.vo.Group;

@Controller
public class GroupController {

	@Autowired
	private GroupService groupService;
	
	@RequestMapping("sale/group/list.do")
	public String selectGroupList(Model model, 
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage) {
		
		int numPerPage = 10; // 한 페이지당 게시글 수
		
		// 1. 현재 페이지 게시글 목록 가져오기
		ArrayList<Map<String, String>> list = 
				new ArrayList<Map<String, String>>(groupService.selectGroupList(cPage, numPerPage));
		
		// 2. 전체 게시글 개수 가져오기
		int totalContents = groupService.selectGroupTotalContents();
		
		// 3. 페이지 계산 후 작성할 HTML 추가
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "sale/group/list.do");
		
		model.addAttribute("list", list)
			.addAttribute("totalContents", totalContents)
			.addAttribute("numPerPage", numPerPage)
			.addAttribute("pageBar", pageBar);
		
		return "sale/group/groupList";
	}
	
	@RequestMapping("sale/group/groupView.do")
	public String selectOneGroup(@RequestParam int boardNo, Model model) {
		
		model.addAttribute("group", groupService.selectOneGroup(boardNo));
	
		return "sale/group/groupView";
	}
	
	@RequestMapping("sale/group/groupForm.do")
	public String insertGroupForm(Model model) {
		
		ArrayList<Map<String, String>> bankList = 
				new ArrayList<Map<String, String>>(groupService.selectBankList());
		
		model.addAttribute("bankList", bankList);
		
		return "sale/group/groupInsert";
	}
	
	@RequestMapping("sale/group/groupFormEnd.do")
	public String insertGroup(Group group,  Model model) {
		
		String loc = "sale/group/groupView";
	
		if(groupService.insertGroup(group) > 0) {
			model.addAttribute("group", groupService.selectOneGroup(group.getBoardNo()));
		}
				
		return loc;
	}
	
	@RequestMapping("sale/group/groupUpdateForm.do")
	public String updateGroupForm(@RequestParam int boardNo, Model model) {
		
		model.addAttribute("group", groupService.selectOneGroup(boardNo));
	
		return "sale/group/groupUpdate";
	}
	
	@RequestMapping("sale/group/groupUpdateFormEnd.do")
	public String updateGroup(Group group, Model model) {
		
		int result = groupService.updateGroup(group);
		
		ArrayList<Map<String, String>> bankList = 
				new ArrayList<Map<String, String>>(groupService.selectBankList());
		
		
		model.addAttribute("group", groupService.selectOneGroup(group.getBoardNo()))
			.addAttribute("bankList", bankList);;
	
		return "sale/group/groupView";
	}
	
	@RequestMapping("sale/group/groupDelete.do")
	public String deleteGroup(@RequestParam int boardNo, Model model) {

		String loc = "/sale/group/list.do";
		System.out.println("boardNo : "+boardNo);
		String msg = (groupService.deleteGroup(boardNo)>0) ? "게시글을 삭제하였습니다." : "게시글 삭제에 실패하였습니다.";

		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	
	
}
