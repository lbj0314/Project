package com.controller.member;

import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.login.AdmDTO;
import com.dto.login.ComDTO;
import com.dto.login.EntDTO;
import com.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;

	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		mav.addObject("sessionClose", true);
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping("/myPageForm")
	public String myPage() {

		return "mypage/mypage";
	}
	
	@RequestMapping("/myPageMember")
	public String myPageMember(Model m) {
		m.addAttribute("member", "member");
		return "mypage/mypage";
	}

	@RequestMapping("/myPageLeave")
	public String myPageLeave(HttpSession session) {
		
		if(session.getAttribute("comLogin")!=null) {
			ComDTO dto = (ComDTO) session.getAttribute("comLogin");
			int comnum = dto.getComnum();
			service.comDelete(comnum);
		}else if(session.getAttribute("entLogin")!=null) {
			EntDTO dto = (EntDTO) session.getAttribute("entLogin");
			int entnum = dto.getEntnum();
			service.entDelete(entnum);
		}
		session.invalidate();
		return "home";
	}
	
	@RequestMapping("/memberManage")
	public String memberManage(Model m) {
		m.addAttribute("membermanage","membermanage");
		return "mypage/mypage";
	}
	
	@RequestMapping("/reviewManage")
	public String reviewManage(Model m) {
		m.addAttribute("reviewmanage","reviewmanage");
		return "mypage/mypage";
	}
	
	@RequestMapping("/memberManageRetrieve")
	public ModelAndView memberManageRetrieve(@RequestParam String category, String userid,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/mypageAfter");
		mav.addObject("memberAfter", "memberAfter");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		if(category.equals("com")) {
			ComDTO comdto = service.comLogin(map);
			session.setAttribute("comdto", comdto);
			mav.addObject("commember", "commember");
		}else if(category.equals("ent")) {
			EntDTO entdto = service.entLogin(map);
			session.setAttribute("entdto", entdto);
			mav.addObject("entmember","entmember");
		}
		return mav;
	}
	
	@RequestMapping("/memberManageDelete")
	public ModelAndView memberManageDelete(@RequestParam String category,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/mypageAfter");
		mav.addObject("afterDelete","afterDelete");
		
		if(category.equals("com")) {
			ComDTO comdto = (ComDTO) session.getAttribute("comdto");
			int comnum = comdto.getComnum();
			service.comDelete(comnum);
			mav.addObject("comDelete", comdto.getComname());
			session.removeAttribute("comdto");
		}else if (category.equals("ent")) {
			EntDTO entdto = (EntDTO)session.getAttribute("entdto");
			int entnum = entdto.getEntnum();
			service.entDelete(entnum);
			mav.addObject("entDelete", entdto.getEntname());
			session.removeAttribute("entdto");
		}
		
		return mav;
	}
	
	
	
	
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
}
