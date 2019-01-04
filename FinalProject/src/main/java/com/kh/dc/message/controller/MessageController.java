package com.kh.dc.message.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dc.common.util.Utils;
import com.kh.dc.common.vo.Message;
import com.kh.dc.message.model.service.MessageService;

@Controller
public class MessageController {

	@Autowired
	private MessageService messageService;
	
	@RequestMapping("/message/messageList.do")
	public String messageList(
			Message message, 
			@RequestParam int no,
			@RequestParam(value="cPage", required=false, defaultValue="1")
			int cPage, 
			Model model) {
		
		int numPerPage = 5;
		
		ArrayList<Map<String, String>> list = 
				new  ArrayList<Map<String, String>>(messageService.selectMessageList(no, cPage, numPerPage));
		System.out.println("list : "+ list);
		
		int totalContents = messageService.selectMessageTotalContents(no);
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "messageList.do", no);
		
		model.addAttribute("list", list)
		.addAttribute("totalContents", totalContents)
		.addAttribute("numPerPage", numPerPage)
		.addAttribute("pageBar", pageBar);
		
		return "/message/messageList";
	}

	@RequestMapping(value="/message/messageInsertForm.do")
	public void insertMessageForm() {
		
	}
	
	@RequestMapping(value="/message/messageInsert.do")
	public String insertMessage(Message message, Model model, HttpSession session) {
		
		int result = messageService.insertMessage(message);
		
		String loc = "/message/messageList.do";
		String msg = "";
		
		if(result > 0) {
			msg = "게시글 등록 성공!";
			loc = "/message/messageList.do?no="+ message.getFromMember();
		} else {
			msg = "게시글 등록 실패!";
		}
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "redirect:/message/messageList.do?no="+ message.getFromMember();	
	}
	
	@RequestMapping("/message/messageDetail.do")
	public String selectOneMessage(@RequestParam int no, Model model) {
		
		model.addAttribute("message", messageService.selectOneMessage(no));
		System.out.println("meesage 내용 : "+ messageService.selectOneMessage(no));
		return "message/messageDetail";
	}
	
	@RequestMapping("/message/messageDelete.do")
	public String deleteMessage(@RequestParam int no, Model model) {

		String loc = "/message/jobBoardList.do";
		System.out.println("no : "+no);
		String msg = (messageService.deleteMessage(no)>0) ? "쪽지를 삭제하였습니다." : "쪽지삭제에 실패하였습니다.";

		model.addAttribute("loc", loc).addAttribute("msg", msg);
		System.out.println(msg);
		System.out.println(no);
		return "redirect:/message/messageList.do?no="+ no;
	}
}
