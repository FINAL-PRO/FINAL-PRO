package com.kh.dc.business.ad.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
		
		System.out.println("정렬 : " + adParams);
		
		
		List<Code> adContentTypeList = adService.selectAdContentList();
		List<Code> adTypeList = adService.selectAdTypeList();
		List<Code> adStatusList = adService.selectAdStatusList();
		List<Ad> adList = adService.selectAdList(adParams);
		
		System.out.println("adList : " + adList);
		
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
	
	@RequestMapping("business/ad/insert.do")
	public String insertAd(Model model, HttpSession session,
			@RequestParam(value="startDate", required=true) @DateTimeFormat(pattern="yyyy-MM-dd") Date startDate,
			@RequestParam(value="endDate", required=true) @DateTimeFormat(pattern="yyyy-MM-dd") Date endDate,
			@RequestParam(value="memberNo", required=true) int memberNo,
			@RequestParam(value="pageNo", required=true) int pageNo,
			@RequestParam(value="sectionNo", required=true) int sectionNo,
			@RequestParam(value="locationNo", required=true) int locationNo,
			@RequestParam(value="adContentType", required=true) String adContentType,
			@RequestParam(value="adType", required=true) String adType,
			@RequestParam(value="status", required=true) String status,
			@RequestParam(value="adContentPath", required=false) MultipartFile adContentPath) {
		
		
		Ad ad = new Ad(startDate, endDate, memberNo, pageNo, sectionNo, locationNo, adContentType, adType, status);
		
		System.out.println("받은 ad : " + ad);
		
		String saveDir = session.getServletContext()
				.getRealPath("/resources/upload/ad");
		
		File dir = new File(saveDir);
		System.out.println("폴더 생성 여부 : " + dir.exists());
		if(dir.exists() == false) dir.mkdirs();
		
		if(!adContentPath.isEmpty()) {
			String originName = adContentPath.getOriginalFilename();
			String ext = originName.substring(originName.lastIndexOf(".")+1);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
			
			int rnNum = (int)(Math.random() * 1000);
			
			String renamedName = sdf.format(new Date()) + "_" + rnNum + "." + ext;
			
			try {
				adContentPath.transferTo(new File(saveDir + "/" + renamedName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			System.out.println("원래 이름 : " + originName);
			System.out.println("바뀐 이름 : " + renamedName);
			
			ad.setAdContentPath(saveDir + "/" + renamedName);
		}
		
		System.out.println("바뀐 ad : " + ad);
		
		
		int result = adService.insertAd(ad);
		
		if(result > 0) {
			return "redirect:/business/ad/list.do";
		}else {
			model.addAttribute("msg", "광고 입력 실패");
			return "common/error";
		}
	}
}


