package com.kh.dc.info.house.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
	public String houseList(Model model,
			@RequestParam(value="dealType", defaultValue="HUSDEAL001") String dealType,
			@RequestParam(value="hType", defaultValue="HUSTYP001") String hType) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("dealType", dealType);
		params.put("hType", hType);
		
		List<House> list = houseService.houseList(params);
		List<Code> dealList = houseService.selectDealList();
		List<Code> roomList = houseService.selectRoomList();
		
		model.addAttribute("list", list);
		model.addAttribute("roomList", roomList);
		model.addAttribute("dealList", dealList);
		model.addAttribute("dealType", dealType);
		model.addAttribute("hType", hType);
		
		return "info/house/list";
	}
	
	@RequestMapping("info/house/view.do")
	public String selectHouse(Model model, @RequestParam int no) {
		House house = houseService.selectHouse(no);
		model.addAttribute("house", house);
		model.addAttribute("bno", no);
		
		return "info/house/houseDetail";
	}
	
	@RequestMapping(value= "info/house/insert.do", method=RequestMethod.POST)
	public String insertHouse(House house) {
		int result = houseService.insertHouse(house);
		
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
	public String updateHouseEnd(House house) {
		
		houseService.updateHouse(house);
		
		return "redirect:/info/house/view.do?no=" + house.getNo();
	}
	
	@RequestMapping("info/house/delete.do")
	public String deleteHouse(@RequestParam int no) {
		houseService.deleteHouse(no);
		
		return "redirect:/info/house/list.do";
	}
}















