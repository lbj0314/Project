package com.controller.oauth;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NaverLoginController {
	
	
	@RequestMapping("/naverLogin")
	public String naverLogin() {
		
		return "home";
		
	}
	
	@RequestMapping("/callback")
	public String callBack(HttpSession session) {
		
		session.setAttribute("naver","안녕하세요 구글 및 네이버 로그인은 로그인만 가능합니다.");
		
		return "home";
	}
	@RequestMapping("/naverLogout")
	public String naverLogout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}

}
