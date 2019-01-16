package com.kh.dc.common.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping("/login/logout.do")
	public String logout() {
		return "common/logout";
	}
	
/*
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginPage(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout,
			Model model) {
		
		System.out.println("		/login 페이지");
		String errorMessge = null;
		if(error != null) {
			errorMessge = "Username or Password is incorrect !!";
		}
		if(logout != null) {
			errorMessge = "You have been successfully logged out !!";
		}
		model.addAttribute("errorMessge", errorMessge);
		return "login";
	}
*/
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null){   
			System.out.println("auth not null");
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		System.out.println("auth null");
		return "index";
	}
}
