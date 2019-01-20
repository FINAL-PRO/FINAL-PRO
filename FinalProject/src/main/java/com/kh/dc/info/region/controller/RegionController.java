package com.kh.dc.info.region.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dc.common.util.Utils;
import com.kh.dc.common.vo.Board;
import com.kh.dc.info.region.model.service.RegionService;
import com.kh.dc.info.region.model.vo.Region;
import com.kh.dc.info.region.model.vo.RegionRe;

@Controller
public class RegionController {
	@Autowired
	private RegionService regionService;
	
	// 리스트
	@RequestMapping("info/region/list.do")
	public String regionList(Model model,
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage) {
		
		
		int numPerPage = 10; // 한 페이지당 게시글 수
		
		// 1. 현재 페이지 게시글 목록 가져오기
		ArrayList<Map<String, String>> list = 
							new ArrayList<Map<String, String>>(regionService.regionList(cPage, numPerPage));
		// 2. 전체 게시글 개수 가져오기
		int totalContents = regionService.selectRegionTotalContents();
		
		// 3. 페이지 계산 후 작성할 HTML 추가
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "list.do");
		
		// list 출력 확인
		System.out.print(list);
		model.addAttribute("list", list);
		model.addAttribute("pageBar", pageBar);
			
		return "info/region/list";
	}
	
	// insert
	@RequestMapping(value="info/region/insert.do", method=RequestMethod.POST)
	public String insertRegion(Region region) {
		
		int result = regionService.insertRegion(region);
		
		return "redirect:/info/region/list.do";
	}
	
	// insertView
	// 회원 넘버 받아오는 거 아직 안 함
	@RequestMapping("info/region/insert/view.do")
	public String insertRegionView( ) {
		
		return "info/region/regionInsert";
	}
	
	// select one
	@RequestMapping("info/region/view.do")
	public String selectRegion( Model model, Model lModel, @RequestParam int no) {
		Region region = regionService.selectRegion(no);
		int likeCount = regionService.regionLikeCountView(no);
		
		regionService.updateCountRegion(no);
		
		model.addAttribute("region", region);
		model.addAttribute("likeCount", likeCount);
		model.addAttribute("bno", no);
		
		/*List<Region> list = regionService.regionList();
		lModel.addAttribute("list", list);*/
		
		return "info/region/regionDetail";
	}
	
	
	// 수정창 이동
	@RequestMapping("info/region/update/view.do")
	public String updateRegion(Model model, @RequestParam int no) {
		
		Region region = regionService.selectRegion(no);
		
		model.addAttribute("region",  region);
		
		return "info/region/regionInsert";
	}
	
	// 수정완료
	@RequestMapping("info/region/update.do")
	public String updateRegionEnd(Region region) {
		regionService.updateRegion(region);
		
		return "redirect:/info/region/list.do";
	}
	
	// 삭제
	@RequestMapping("info/region/delete.do")
	public String deleteRegion(@RequestParam int no) {
		regionService.deleteRegionLike(no);
		regionService.deleteRegion(no);
		
		return "redirect:/info/region/list.do";
	}
	
	// 좋아요 
	// 추후 member No 에 @RequestParam 추가 현재는 임의로 1 넣었음

	@RequestMapping("info/region/regionLikeCount.do")
	public String regionLikeCount(@RequestParam(value="lc") int lc) {
		
		int no = lc;
		
		regionService.regionLikeCount(no);
		
		return "info/region/regionDetail";
	}
	
/*	@RequestMapping(value="info/region/getRegionListData.do",produces ="application/text; charset=utf8")
	@ResponseBody
	public String getRegionListData() {
		String result = "";
		
		List<Region> regionList = regionService.regionList();

		
		for (Region region : regionList) {
			result += "<tr><td>";
			result += "<a href='/dc/info/region/rgSelectOne.do?no=" + region.getNo() + "'>" + region.getTitle() + "</a>";
			result += "</td></tr>";
			
			System.out.println("result : " + result);
		}
		
		return result;
	}*/

}



