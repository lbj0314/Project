package com.controller.ms;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;

@Controller
public class MesCont {

	private MessageSource messages;
	
	LocaleResolver localeResolver;

	public void setLocaleResolver(LocaleResolver localeResolver) {
		this.localeResolver = localeResolver;
	}

	@Autowired
	public void setMessages(MessageSource messages) {
		this.messages = messages;
	}

	@RequestMapping("/setChangeLocale.do")
	public String aaa(HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		/*
		 * String message = this.messages.getMessage("spring.mesg", null, "Required",
		 * Locale.KOREA); System.out.println(message);
		 */

		Locale locale = localeResolver.resolveLocale(request);

		String message =null;
		
		if("en".equals(locale.toString())) {
	 		localeResolver.setLocale(request, response, Locale.US);
			}
		if("ko".equals(locale.toString())) {
		 		localeResolver.setLocale(request, response, Locale.KOREA);
			}
		if("de".equals(locale.toString())) {
	 		localeResolver.setLocale(request, response, Locale.GERMAN);
			}
		if("zh".equals(locale.toString())) {
	 		localeResolver.setLocale(request, response, Locale.CHINA);
			}
		if("jp".equals(locale.toString())) {
	 		localeResolver.setLocale(request, response, Locale.JAPANESE);
	 		System.out.println(locale);
			}
		if("fr".equals(locale.toString())) {
	 		localeResolver.setLocale(request, response, Locale.FRANCE);
			}
		if("it".equals(locale.toString())) {
	 		localeResolver.setLocale(request, response, Locale.ITALIAN);
			}
	      
		return "include/guideus";

	}
}


