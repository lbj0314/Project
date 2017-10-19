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
		/*if("jp".equals(locale.toString())) {
	 		localeResolver.setLocale(request, response, Locale.JAPAN);
	 		System.out.println(locale);
			}*/
		if("fr".equals(locale.toString())) {
	 		localeResolver.setLocale(request, response, Locale.FRANCE);
			}
		if("it".equals(locale.toString())) {
	 		localeResolver.setLocale(request, response, Locale.ITALIAN);
			}
	
		return "home";

	}
}


/*if (locale.matches("ko")) {
	locales = Locale.KOREAN;
	System.out.println(locales);
	message = this.messages.getMessage("spring.mesg", null, "Required", Locale.KOREA);
	System.out.println(message);
}
if (locale.matches("en")) {
	locales = Locale.US;
	System.out.println(locales);
	message = this.messages.getMessage("spring.mesg", new String[] {"a", "b"}, "Required", Locale.US);
	System.out.println(message);
}
if (locale.matches("ch")) {
	locales = Locale.CHINA;
	System.out.println(locales);
	message = this.messages.getMessage("spring.mesg", null, "Required", Locale.CHINA);
	System.out.println(message);
}
if (locale.matches("de")) {
	locales = Locale.GERMAN;
	System.out.println(locales);
	message = this.messages.getMessage("spring.mesg", null, "Required", Locale.GERMAN);
	System.out.println(message);
}
*/

/*
 * public class MesCont {
 * 
 * @RequestMapping(value = "/setChangeLocale.do") public String
 * changeLocale(@RequestParam(required = false) String locale,) { HttpSession
 * session = request.getSession(); Locale locales = null; // 넘어온 파라미터에 ko가 있으면
 * Locale의 언어를 한국어로 바꿔준다. // 그렇지 않을 경우 영어로 설정한다. if (locale.matches("ko")) {
 * locales = Locale.KOREAN; } else { locales = Locale.ENGLISH; }
 * 
 * // 해당 컨트롤러에게 요청을 보낸 주소로 돌아간다. String redirectURL = "redirect:" +
 * request.getHeader("referer"); return redirectURL; } }
 */

/*
 * public class MesCont {
 * 
 * private MessageSource messages;
 * 
 * @Autowired public void setMessages(MessageSource messages) { this.messages =
 * messages; }
 * 
 * @RequestMapping("/setChangeLocale.do") public String aaa() { String message =
 * this.messages.getMessage("spring.mesg", null, "Required", Locale.KOREA);
 * System.out.println(message);
 * 
 * return "home";
 * 
 * } }
 */
