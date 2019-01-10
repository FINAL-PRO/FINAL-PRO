package com.kh.dc.message.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		String res;
		String loc = "/message/messageList.do";
		String msg = "";
		
		//String replyNick = messageService.replyNick();
		if(message.getFrommNick().equals(message.getTomNick())) {
			msg = "작성자가 받는사람과 같습니다.";
			loc = "/message/messageList.do?no="+ message.getFromMember();
			res = "/common/msg";
		} else {
			int result = messageService.insertMessage(message);
			if(result > 0) {
				msg = "게시글 등록 성공!";
				loc = "/message/messageList.do?no="+ message.getFromMember();
				res = "/common/msg";
			} else {
				msg = "게시글 등록 실패!";
				loc = "/message/messageList.do?no="+ message.getFromMember();
				res = "/common/msg";
			}
		}	

		model.addAttribute("loc", loc).addAttribute("msg", msg);
		System.out.println(message);
		//return "redirect:/message/messageList.do?no="+ message.getFromMember();
		return res;
	}
	
	@RequestMapping("/message/messageDetail.do")
	public String selectOneMessage(@RequestParam int no, Model model) {
		
		model.addAttribute("message", messageService.selectOneMessage(no));
		System.out.println("meesage 내용 : "+ messageService.selectOneMessage(no));
		return "message/messageDetail";
	}
	
	@RequestMapping("/message/messageDelete.do")
	public String deleteMessage(@RequestParam int no, @RequestParam int memNo, Model model) {
		
		String loc = "/message/messageList.do?no="+ memNo;
		
		String msg = (messageService.deleteMessage(no)>0) ? "쪽지를 삭제하였습니다." : "쪽지삭제에 실패하였습니다.";
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		System.out.println(msg);
		System.out.println(no);
		return "common/msg";
	}
	@RequestMapping("/message/checkToNick.do")
	@ResponseBody
	public Map<String, Object> checkToNick(@RequestParam String nickName){
		Logger logger = LoggerFactory.getLogger(MessageController.class);
		
		if(logger.isDebugEnabled())	logger.debug("아이디 중복체크 확인!!");
		Map<String, Object> map = new HashMap<String, Object>();
		boolean isUsable = messageService.checkToNick(nickName) == 0 ? true : false;
		
		map.put("isUsable", isUsable);
		
		return map;
		
	}
}
