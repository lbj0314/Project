package com.controller.oauth;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NaverLoginController {
	
	
	@RequestMapping("/naverLogin")
	public String naverLogin() {
		
		return "home";
		
	}
	
	@RequestMapping("/callback")
	public String callBack(HttpSession session,Model m) {
		
		session.setAttribute("naver","안녕하세요 구글 및 네이버 로그인은 로그인만 가능합니다.");
		m.addAttribute("bb",1);
		return "home";
	}
	@RequestMapping("/naverLogout")
	public String naverLogout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}

}
