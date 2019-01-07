package com.kh.dc.common.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	@RequestMapping("/login/loginForm.do")
	public String Login() {
		return "common/loginForm";
	}
	
	@RequestMapping("/login/accessDenied.do")
	public String accessDenied() {
		return "common/accessDenied";
	}
}
