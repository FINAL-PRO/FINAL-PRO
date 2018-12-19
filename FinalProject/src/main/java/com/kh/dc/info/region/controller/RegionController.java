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

@Controller
public class RegionController {
	@Autowired
	RegionService rs;
	
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
	
	// select one
	@RequestMapping("info/region/selctOne.do")
	public String selectRegion(Region rg, Model model) {
		
		return "info/region/regionDetail";
	}
	
	
	// 수정창 이동
	@RequestMapping("info/region/updateRegion.do")
	public String updateRegion(Model model, @RequestParam int no) {
		model.addAttribute("region", rs.selectRegion(no));
		
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
}


