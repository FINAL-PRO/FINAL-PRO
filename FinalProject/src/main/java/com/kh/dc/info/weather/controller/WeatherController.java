package com.kh.dc.info.weather.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes(value= {"member"})
@Controller
public class WeatherController {
	
	@RequestMapping("info/weather/list.do")
	public String weatherList(Model model) {				
		
		return "info/weather/list";
	}
	
}
