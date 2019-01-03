package com.kh.dc.community.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dc.common.vo.Board;
import com.kh.dc.community.notice.model.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping("community/notice/list.do")
	public String noticeList() {
		return "community/notice/list";
	}
	
	@RequestMapping("community/notice/getListData.do")
	@ResponseBody
	public List<Board> getListData() {
		List<Board> noticeList = noticeService.selectNoticeListData();
		
		return noticeList;
	}
}
