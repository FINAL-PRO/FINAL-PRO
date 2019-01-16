package com.kh.dc.info.region.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dc.common.vo.Board;
import com.kh.dc.info.region.model.service.RegionService;
import com.kh.dc.info.region.model.vo.Region;
import com.kh.dc.info.region.model.vo.RegionRe;

@Controller
public class RegionController {
	@Autowired
	private RegionService rs;
	
	// 리스트
	@RequestMapping("info/region/list.do")
	public String regionList(Model model) {
		List<Region> list = rs.regionList();
		
		// list 출력 확인
		System.out.print(list);
		model.addAttribute("list", list);
			
		return "info/region/list";
	}
	
	// insert
	@RequestMapping(value="info/region/insert.do", method=RequestMethod.POST)
	public String insertRegion(Region rg) {
		System.out.println("받아온 정보 : " + rg);
		
		int result = rs.insertRegion(rg);
		System.out.println("insert 결과 : " + result);
		
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
		System.out.println("con : " + no);
		Region region = rs.selectRegion(no);
		int likeCount = rs.regionLikeCountView(no);
		
		rs.updateCountRegion(no);
		
		model.addAttribute("region", region);
		model.addAttribute("likeCount", likeCount);
		model.addAttribute("bno", no);
		
		System.out.println("likeCount : "  + likeCount);
		
		System.out.println("model" + model);
		
		
		List<Region> list = rs.regionList();
		lModel.addAttribute("list", list);
		
		return "info/region/regionDetail";
	}
	
	
	// 수정창 이동
	@RequestMapping("info/region/update/view.do")
	public String updateRegion(Model model, @RequestParam int no) {
		
		Region region = rs.selectRegion(no);
		
		model.addAttribute("region",  region);
		
		System.out.println("수정 model  :  " + model );
		
		return "info/region/regionInsert";
	}
	
	// 수정완료
	@RequestMapping("info/region/update.do")
	public String updateRegionEnd(Region rg) {
		rs.updateRegion(rg);
		
		System.out.println("수정con region :  " + rg );
		
		return "redirect:/info/region/list.do";
	}
	
	// 삭제
	@RequestMapping("info/region/delete.do")
	public String deleteRegion(@RequestParam int no) {
		rs.deleteRegionLike(no);
		rs.deleteRegion(no);
		
		return "redirect:/info/region/list.do";
	}
	
	// 좋아요 
	// 추후 member No 에 @RequestParam 추가 현재는 임의로 1 넣었음

	@RequestMapping("info/region/regionLikeCount.do")
	public String regionLikeCount(@RequestParam(value="lc") int lc) {
		
		int no = lc;
		
		System.out.println(lc);
		
		rs.regionLikeCount(no);
		
		return "info/region/regionDetail";
	}
	
	@RequestMapping(value="info/region/getRegionListData.do",produces ="application/text; charset=utf8")
	@ResponseBody
	public String getRegionListData() {
		String result = "";
		
		List<Region> regionList = rs.regionList();

		
		for (Region region : regionList) {
			result += "<tr><td>";
			result += "<a href='/dc/info/region/rgSelectOne.do?no=" + region.getNo() + "'>" + region.getTitle() + "</a>";
			result += "</td></tr>";
			
			System.out.println("result : " + result);
		}
		
		return result;
	}

}



