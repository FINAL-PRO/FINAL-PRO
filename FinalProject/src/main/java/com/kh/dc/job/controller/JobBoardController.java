package com.kh.dc.job.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.kh.dc.job.model.service.JobBoardService;
import com.kh.dc.job.model.vo.JobBoard;
import com.kh.dc.common.util.Utils;
import com.kh.dc.common.vo.Code;

@Controller
public class JobBoardController {
	
	@Autowired
	private JobBoardService jobBoardService;  

	@RequestMapping("/job/jobBoard/jobBoardList.do")
	public String jobBoardList(
			@RequestParam(value="arrayType", required=false, defaultValue="B.WRITEDATE")String arrayType,
			@RequestParam(value="type", defaultValue="selAll", required=false) String type,
			@RequestParam(value="jobType", defaultValue="selAllJob", required=false) String jobType,
			@RequestParam(value="salType", defaultValue="selAllSel", required=false) String salType,
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, 
			Model model) {

		int numPerPage = 10;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("arrayType", arrayType);
		map.put("type", type);
		map.put("jobType", jobType);
		map.put("salType", salType);
		
		
		System.out.println("map : "+ map);
		
		ArrayList<Map<String, String>> list = 
				new  ArrayList<Map<String, String>>(
						jobBoardService.selectJobBoardList(map, cPage, numPerPage));
		
		//List<JobBoard> arrayJobBoard = jobBoardService.selectArrayType(arrayType);
		
		List<Code> typeList = jobBoardService.selectJobBoardTypeList();
		List<Code> jobTypeList = jobBoardService.selectJobBoardJobTypeList();
		List<Code> salTypeList = jobBoardService.selectJobBoardSalTypeList();
		

/*		for(JobBoard jb : arrayJobBoard) {
			System.out.println(jb.getNo() + " : " + jb.getJobType() + " : " + jb.getSalType() + " : " + jb.getType());
		}*/
	
		int totalContents = jobBoardService.selectJobBoardTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "jobBoardList.do");
		
		model.addAttribute("list", list)
		.addAttribute("arrayType", arrayType)
		.addAttribute("type", type)
		.addAttribute("jobType", jobType)
		.addAttribute("salType", salType)
		.addAttribute("typeList", typeList)
		.addAttribute("jobTypeList", jobTypeList)
		.addAttribute("salTypeList", salTypeList)
		.addAttribute("totalContents", totalContents)
		.addAttribute("numPerPage", numPerPage)
		.addAttribute("pageBar", pageBar);
		
		return "/job/jobBoard/jobBoardList";
	}
	
	@RequestMapping("/job/jobBoard/searchJobBoard.do")
	public String searchJobBoardList(
			@RequestParam(value="jb_Search", defaultValue="s-All", required=false) String jb_Search,
			@RequestParam(value="searchCont", required=false) String searchCont,			
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, 
			Model model) {
		
		int numPerPage = 10;

		Map<String, String> map = new HashMap<String, String>();
		map.put("jb_Search", jb_Search);
		map.put("searchCont", searchCont);
		
		System.out.println("map : "+ map);
		
		
		ArrayList<Map<String, String>> list = 
				new  ArrayList<Map<String, String>>(
						jobBoardService.searchJobBoardList(map, cPage, numPerPage));
		
		int totalContents = jobBoardService.searchJobBoardTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "jobBoardList.do");
		
		model.addAttribute("list", list)
		.addAttribute("jb_Search", jb_Search)
		.addAttribute("searchCont", searchCont)
		.addAttribute("totalContents", totalContents)
		.addAttribute("numPerPage", numPerPage)
		.addAttribute("pageBar", pageBar);
		
		return "/job/jobBoard/jobBoardList";
	}
	
	@RequestMapping("job/jobBoard/jobBoardForm.do")
	public void boardForm() {
		
	}
	@RequestMapping("job/jobBoard/jobBoardDetail.do")
	public String selectOneBoard(@RequestParam int no, Model model) {
		JobBoard jobBoard = jobBoardService.selectOneJobBoard(no);
		
		if(jobBoard != null) jobBoardService.updateViewCount(jobBoard.getNo());
		
		model.addAttribute("jobBoard", jobBoard);
		model.addAttribute("bno", jobBoard.getBoardNo());
		
		return "job/jobBoard/jobBoardDetail";
	}
	
	@RequestMapping("job/jobBoard/jobBoardInsertForm.do")
	public void jobBoardInsertForm () {
		
	}
	
	@RequestMapping(value="job/jobBoard/insertJobBoard.do", method=RequestMethod.POST)
	public String insertJobBoard(JobBoard jobBoard, Model model, HttpSession session) {
		
		int result = jobBoardService.insertJobBoard(jobBoard);
		
		String loc = "/job/jobBoard/jobBoardList.do";
		String msg = "";
		
		if(result > 0) {
			msg = "게시글 등록 성공!";
			loc = "/jobBoard/jobBoardDetail.do?no="+ jobBoard.getNo();
		} else {
			msg = "게시글 등록 실패!";
		}
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "redirect:/job/jobBoard/jobBoardDetail.do?no="+ jobBoard.getNo();	
	}

	@RequestMapping("/job/jobBoard/jobBoardComPop.do")
	public String jobBoardComPop(
			@RequestParam(value="cPage", required=false, defaultValue="1")
			int cPage, 
			Model model) {
		
		int numPerPage = 5;
		
		ArrayList<Map<String, String>> list = new ArrayList<Map<String, String>>(
				jobBoardService.selectJobBoardComPop(cPage, numPerPage));
		
		int totalContents = jobBoardService.selectJobBoardComPopTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "jobBoardComPop.do");
		
		model.addAttribute("list", list)
		.addAttribute("totalContents", totalContents)
		.addAttribute("numPerPage", numPerPage)
		.addAttribute("pageBar", pageBar);
		
		return "job/jobBoard/jobBoardComPop";
	}

	@RequestMapping("/job/jobBoard/updateJobBoardForm.do")
	public String updateJobBoardForm(@RequestParam int no, Model model) {
		JobBoard jobBoard = jobBoardService.selectOneJobBoard(no);
		
		model.addAttribute("jobBoard", jobBoard);
		
		return "job/jobBoard/jobBoardUpdate";
	}
	
	@RequestMapping(value="job/jobBoard/jobBoardUpdate.do", method=RequestMethod.POST)
	public String updateJobBoard(JobBoard jobBoard, Model model) {
		
		int result = jobBoardService.updateJobBoard(jobBoard);
	
		String loc = "/job/jobBoard/jobBoardList.do";
		String msg = "";
		
		if(result > 0) {
			msg = "게시글 수정 성공!";
			loc = "/jobBoard/jobBoardDetail.do?no="+ jobBoard.getNo();
		} else {
			msg = "게시글 수정 실패!";
		}
		model.addAttribute("loc", loc).addAttribute("msg", msg);
	
		return "redirect:/job/jobBoard/jobBoardDetail.do?no="+ jobBoard.getNo();	
	}
	@RequestMapping("/job/jobBoard/endJobBoard.do")
	public String endJobBoard(@RequestParam int boardNo, Model model) {

		String loc = "/job/jobBoard/jobBoardList.do";
		System.out.println("boardNo : "+boardNo);
		String msg = (jobBoardService.endJobBoard(boardNo)>0) ? "게시글을 마감하였습니다." : "게시글 마감에 실패하였습니다.";
		System.out.println("옵니까");
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/job/jobBoard/deleteJobBoard.do")
	public String deleteJobBoard(@RequestParam int boardNo, Model model) {

		String loc = "/job/jobBoard/jobBoardList.do";
		System.out.println("boardNo : "+boardNo);
		String msg = (jobBoardService.deleteJobBoard(boardNo)>0) ? "게시글을 삭제하였습니다." : "게시글 삭제에 실패하였습니다.";

		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		
		return "common/msg";
	}

}
