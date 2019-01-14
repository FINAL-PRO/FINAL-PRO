package com.kh.dc.info.house.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dc.common.vo.Code;
import com.kh.dc.info.house.model.service.HouseService;
import com.kh.dc.info.house.model.vo.House;

@Controller
public class HouseController {

	@Autowired
	private HouseService houseService;
	
	@RequestMapping("info/house/list.do")
	public String houseList(Model model) {
		List<House> list = houseService.houseList();
		model.addAttribute("list", list);
		
		System.out.println("list hType : " + list);
		return "info/house/list";
	}
	
	@RequestMapping("info/house/view.do")
	public String selectHouse(Model model, @RequestParam int no) {
		House house = houseService.selectHouse(no);
		model.addAttribute("house", house);
		
		return "info/house/houseDetail";
	}
	
	@RequestMapping(value= "info/house/insert.do", method=RequestMethod.POST)
	public String insertHouse(House hs) {
		int result = houseService.insertHouse(hs);
		
		return "redirect:/info/house/list.do";
	}
	
	@RequestMapping("info/house/insert/view.do")
	public String insertHouseview(Model model) {
		
		List<Code> roomList = houseService.selectRoomList();
		List<Code> dealList = houseService.selectDealList();
		
		model.addAttribute("roomList", roomList);
		model.addAttribute("dealList", dealList);
		
		return "info/house/houseInsert";
	}
	
	@RequestMapping("info/house/update/view.do")
	public String updateHouse(Model model, @RequestParam int no) {
		House house = houseService.selectHouse(no);

		List<Code> roomList = houseService.selectRoomList();
		List<Code> dealList = houseService.selectDealList();
		
		model.addAttribute("roomList", roomList);
		model.addAttribute("dealList", dealList);
		model.addAttribute("house", house);
		
		return "info/house/houseInsert";
	}
	
	@RequestMapping("info/house/update.do")
	public String updateHouseEnd(House hs) {
		
		System.out.println("house : " + hs);
		System.out.println("area : " + hs.getArea());
		houseService.updateHouse(hs);
		
		return "redirect:/info/house/view.do?no=" + hs.getNo();
	}
	
	@RequestMapping("info/house/delete.do")
	public String deleteHouse(@RequestParam int no) {
		houseService.deleteHouse(no);
		
		return "redirect:/info/house/list.do";
	}
}















