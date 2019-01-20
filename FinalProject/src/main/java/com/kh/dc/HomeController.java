package com.kh.dc;

import java.security.Principal;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.dc.community.free.model.service.FreeService;
import com.kh.dc.community.notice.model.service.NoticeService;
import com.kh.dc.member.model.service.MemberService;
import com.kh.dc.member.model.vo.Member;
import com.kh.dc.sale.group.model.service.GroupService;
import com.kh.dc.sale.used.model.service.UsedService;
import com.kh.dc.common.vo.Board;

/**
 * Handles requests for the application home page.
 */
@SessionAttributes(value= {"member"})
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	NoticeService noticeService;
	@Autowired
	private FreeService freeService;
	@Autowired
	private GroupService groupService;
	@Autowired
	private UsedService usedService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, Principal principal) {
		
		model = loginProcess(model, principal);
		
		return "index";
	}
	
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String index(Locale locale, Model model, Principal principal) {
		model = loginProcess(model, principal);

		return "index";
	}
	
	public Model loginProcess(Model model, Principal principal) {
		
		if(principal != null) {
			System.out.println(principal.getName());
			Member m = memberService.selectOne(principal.getName());
			model.addAttribute("member", m);
		}
		
		List<Board> noticeList = noticeService.selectNoticeListData();
		List<Board> freeList = freeService.selectFreeListData();
		List<Board> groupList = groupService.selectGroupList();
		List<Board> usedList = usedService.selectMainUsedList();
		
		System.out.println("used : " + usedList);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("freeList", freeList);
		model.addAttribute("groupList", groupList);
		model.addAttribute("usedList", usedList);
		
		return model;
	}
	
}
