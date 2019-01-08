package com.kh.dc.common.exception;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExceptionController {

	@RequestMapping("/login_duplicate.do")
	public String duplcateLogin() {
		return "common/duplcateLogin";
	}
}
