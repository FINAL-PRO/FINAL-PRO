package com.kh.dc.info.region.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	@RequestMapping(value="info/region/insertRegion.do", method=RequestMethod.POST)
	public String insertRegion(Region rg) {
		System.out.println("받아온 정보 : " + rg);
		
		int result = rs.insertRegion(rg);
		System.out.println("insert 결과 : " + result);
		
		return "redirect:/";
	}
	
	// insertView
	// 회원 넘버 받아오는 거 아직 안 함
	@RequestMapping("info/region/insertRegionView.do")
	public String insertRegionView( ) {
		
		return "info/region/regionInsert";
	}
	

	
	// select one
	@RequestMapping("info/region/rgSelectOne.do")
	public String selectRegion( Model model, Model lModel, @RequestParam int no) {
		System.out.println("con : " + no);
		Region region = rs.selectRegion(no);
		
		model.addAttribute("region", region);
		
		System.out.println("model" + model);
		
		
		List<Region> list = rs.regionList();
		lModel.addAttribute("list", list);
		
		return "info/region/regionDetail";
	}
	
	
	// 수정창 이동
	@RequestMapping("info/region/updateRegion.do")
	public String updateRegion(Model model, @RequestParam int no) {
		
		Region region = rs.selectRegion(no);
		
		model.addAttribute("region",  region);
		
		System.out.println("수정 model  :  " + model );
		
		return "info/region/regionInsert";
	}
	
	// 수정완료
	@RequestMapping("info/region/updateRegionEnd.do")
	public String updateRegionEnd(Region rg) {
		rs.updateRegion(rg);
		
		return "info/region/lregionDetail.do";
	}
	
	@RequestMapping("info/region/deleteRegion.do")
	public String deleteRegion(@RequestParam int no) {
		rs.deleteRegion(no);
		
		return "redirect:/info/region/list.do";
	}
	
	
	// 댓글 추가
	@RequestMapping(value="info/region/reInsertRegion.do",method=RequestMethod.POST)
	public String reInsertRegion(RegionRe rre) {
		System.out.println( "댓글 정보 : " + rre);
		
		int result = rs.reInsertRegion(rre);
		System.out.println("reInsert 결과 : " + result);
		
		return "info/region/regionDetail";
	}
}



