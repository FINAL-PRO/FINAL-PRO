package com.kh.dc.sale.group.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dc.common.util.Utils;
import com.kh.dc.common.vo.Board;
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
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "list.do");
		
		model.addAttribute("list", list)
			.addAttribute("totalContents", totalContents)
			.addAttribute("numPerPage", numPerPage)
			.addAttribute("pageBar", pageBar);
		
		return "sale/group/groupList";
	}
	
	@RequestMapping("sale/group/groupView.do")
	public String selectOneGroup(@RequestParam int boardNo, Model model) {

		Group group = groupService.selectOneGroup(boardNo);
		
		ArrayList<Map<String, String>> ghList = 
				new ArrayList<Map<String, String>>(groupService.selectGroupHistory(group.getNo()));
		
		System.out.println("ghList : " + ghList);
		
		model.addAttribute("group", group)
			 .addAttribute("statusList", groupService.selectStatusList())
			 .addAttribute("ghList", ghList);
	
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
			model.addAttribute("group", groupService.selectOneGroup(group.getBoardNo()))
				 .addAttribute("statusList", groupService.selectStatusList());
		}
				
		return loc;
	}
	
	@RequestMapping("sale/group/groupUpdateForm.do")
	public String updateGroupForm(@RequestParam int boardNo, Model model) {
		
		model.addAttribute("group", groupService.selectOneGroup(boardNo))
			 .addAttribute("bankList", groupService.selectBankList());;
	
		return "sale/group/groupUpdate";
	}
	
	@RequestMapping("sale/group/groupUpdateFormEnd.do")
	public String updateGroup(Group group, Model model) {
		
		int result = groupService.updateGroup(group);

		model.addAttribute("group", groupService.selectOneGroup(group.getBoardNo()));
	
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
	
	@RequestMapping("sale/group/settingGroup.do")
	@ResponseBody
	public String settingGroup(@RequestParam Map<String, String> groupHistory) {
		
		return (groupService.selectOneGroupHistory(groupHistory)!=null) ? "OK" : "NO";
	}
	
	@RequestMapping("sale/group/gHistorySwitch.do")
	@ResponseBody
	public String switchGroupHistroy(@RequestParam Map<String, String> ghMap) {
		
		int result = 0;
		
		System.out.println("GroupHistory : " + ghMap);
		
		int remain = groupService.selectRemainCount(Integer.parseInt(ghMap.get("groupNo")));
		
		if(ghMap.get("req").equals("in")) {
			result = (remain > 0) ? groupService.insertGroupHistory(ghMap) : 2;
		} else {
			result = (remain > 0) ? groupService.deleteGroupHistory(ghMap)*3 : 4;
		}

		return String.valueOf(result);
	}
	
	@RequestMapping("sale/group/updateStatus.do")
	@ResponseBody
	public String updateStatus(@RequestParam Map<String, String> status) {
		
		return (groupService.updateStatus(status) > 0) ? "OK" : "NO";
	}	
	
	@RequestMapping("sale/group/getListData.do")
	@ResponseBody
	public List<Board> getListData(){
		List<Board> groupList = groupService.selectGroupList();
		
		return groupList;
	}
	
	
}
