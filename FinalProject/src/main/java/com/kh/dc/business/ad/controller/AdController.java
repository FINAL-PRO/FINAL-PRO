package com.kh.dc.business.ad.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dc.business.ad.model.service.AdService;
import com.kh.dc.common.vo.Ad;
import com.kh.dc.common.vo.AdLocation;
import com.kh.dc.common.vo.AdPage;
import com.kh.dc.common.vo.AdSection;
import com.kh.dc.common.vo.Code;

@Controller
public class AdController {
	
	@Autowired
	AdService adService;
	
	@RequestMapping("business/ad/list.do")
	public String adList(
			@RequestParam(value="adContent", defaultValue="ADCON001", required=false) String adContent,
			@RequestParam(value="adType", defaultValue="ADTYPE001", required=false) String adType,
			@RequestParam(value="adStatus", defaultValue="ADSTATUS002", required=false) String adStatus,
			Model model) {
		
		Map<String, Object> adParams = new HashMap<String, Object>();
		
		adParams.put("adContent", adContent);
		adParams.put("adType", adType);
		adParams.put("adStatus", adStatus);
		
		
		List<Code> adContentTypeList = adService.selectAdContentList();
		List<Code> adTypeList = adService.selectAdTypeList();
		List<Code> adStatusList = adService.selectAdStatusList();
		List<Ad> adList = adService.selectAdList(adParams);
		
		model.addAttribute("adList", adList);
		
		model.addAttribute("adContentTypeList", adContentTypeList);
		model.addAttribute("adTypeList", adTypeList);
		model.addAttribute("adStatusList", adStatusList);
		
		model.addAttribute("adContent", adContent);
		model.addAttribute("adType", adType);
		model.addAttribute("adStatus", adStatus);
		
		return "business/ad/list";
	}
	
	@RequestMapping("business/ad/insertForm.do")
	public String insertForm(Model model) {
		List<AdPage> adPageList = adService.selectAdPageList();
		List<AdSection> adSectionList = adService.selectAdSectionList();
		List<AdLocation> adLocationList = adService.selectAdLocationList();
		
		List<Code> adContentTypeList = adService.selectAdContentList();
		List<Code> adTypeList = adService.selectAdTypeList();
		
		model.addAttribute("adPageList",adPageList);
		model.addAttribute("adSectionList",adSectionList);
		model.addAttribute("adLocationList",adLocationList);
		
		model.addAttribute("adContentTypeList", adContentTypeList);
		model.addAttribute("adTypeList", adTypeList);
		
		return "business/ad/InsertForm";
	}
}


