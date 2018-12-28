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
	private HouseService hss;
	
	@RequestMapping("info/house/list.do")
	public String houseList(Model model) {
		List<House> list = hss.houseList();
		model.addAttribute("list", list);
		
		System.out.println("list hType : " + list);
		return "info/house/list";
	}
	
	@RequestMapping("info/house/selectOne.do")
	public String selectHouse(Model model, Model lModel, @RequestParam int no) {
		House house = hss.selectHouse(no);
		model.addAttribute("house", house);
		
		List<House> list = hss.houseList();
		lModel.addAttribute("list", list);
		
		
		System.out.println("no : " + no);
		System.out.println("model : " + model);
		
		return "info/house/houseDetail";
	}
	
	@RequestMapping(value= "info/house/insertHouse.do", method=RequestMethod.POST)
	public String insertHouse(House hs) {
		int result = hss.insertHouse(hs);
		
		return "redirect:/";
	}
	
	@RequestMapping("info/house/insertHouseV.do")
	public String insertHouseview(Model model) {
		
		List<Code> roomList = hss.selectRoomList();
		List<Code> dealList = hss.selectDealList();
		
		model.addAttribute("roomList", roomList);
		model.addAttribute("dealList", dealList);
		
		return "info/house/houseInsert";
	}
	
	@RequestMapping("info/house/updateHouse.do")
	public String updateHouse(Model model, @RequestParam int no) {
		House house = hss.selectHouse(no);
		
		model.addAttribute("house", house);
		
		return "info/house/houseInsert";
	}
	
	@RequestMapping("info/house/updateHouseEnd.do")
	public String updateHouseEnd(House hs) {
		hss.updateHouse(hs);
		
		return "info/house/houseDetail.do";
	}
	
	@RequestMapping("info/house/deleteHouse.do")
	public String deleteHouse(@RequestParam int no) {
		hss.deleteHouse(no);
		
		return "info/house/list.do";
	}
}















