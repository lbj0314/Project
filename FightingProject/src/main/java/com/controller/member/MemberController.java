package com.controller.member;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.support.ServletContextLiveBeansView;
import org.springframework.web.servlet.ModelAndView;

import com.dto.login.AdmDTO;
import com.dto.login.ComDTO;
import com.dto.login.EntDTO;
import com.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;

	@RequestMapping("/login")
	public ModelAndView Login(@RequestParam String wholog, String userid, String passwd,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("passwd", passwd);
		
		if(wholog.equals("com")) {
			
			ComDTO dto = service.comLogin(map);
			if(dto!=null) {
				
				session.setAttribute("comLogin", dto);
				session.setAttribute("alert", "true");
			}else {
				mav.addObject("loginFail","loginFail");
			}
			
		}else if(wholog.equals("ent")) {
			
			EntDTO dto = service.entLogin(map);
			if(dto!=null) {
				
				session.setAttribute("entLogin", dto);
				session.setAttribute("alert", "true");
			}else {
				mav.addObject("loginFail","loginFail");
			}
			
		}else {
			
			AdmDTO dto = service.admLogin(map);
			if(dto!=null) {
				mav.setViewName("home");
				session.setAttribute("admLogin", dto);
				session.setAttribute("alert", "true");
			}else {
				mav.addObject("loginFail","loginFail");
			}
			
		}
		return mav;
	}
	
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		mav.addObject("sessionClose", true);
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping("/myPageForm")
	public String myPage(Model m) {
		m.addAttribute("member", "member");
		return "mypage/mypage";
	}
	
	@RequestMapping("/mypageMember")
	public String mypageMember() {
		return "mypage/"
	}
}
