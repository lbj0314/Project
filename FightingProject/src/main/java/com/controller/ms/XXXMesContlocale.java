/*package com.controller.ms;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;

@Controller
public class XXXMesContlocale {

	private MessageSource messages;

	@Autowired
	public void setMessages(MessageSource messages) {
		this.messages = messages;
	}
	
	@Autowired
    LocaleResolver localeResolver;

	@RequestMapping("/setChangeLocale.do")
	public String aaa(@RequestParam(required = false) String locale, HttpServletRequest request
            , HttpServletResponse response) {
		
		 * String message = this.messages.getMessage("spring.mesg", null, "Required",
		 * Locale.KOREA); System.out.println(message);
		 
		
		//request parameter "locale"에 사용자가 설정한 locale을 가지고 온다.(ex> en, ko)
        Locale locales = new Locale(request.getParameter("locale"));
        //localeResolver에 locale 셋팅
        localeResolver.setLocale(request, response, locales);
        //셋팅된 locale 확인

		if (locale.matches("ko")) {
			locales = Locale.KOREAN;
			System.out.println(locales);
		}
		if (locale.matches("en")) {
			locales = Locale.US;
			System.out.println(locales);
		}
		if (locale.matches("ch")) {
			locales = Locale.CHINA;
			System.out.println(locales);
		}
		if (locale.matches("de")) {
			locales = Locale.GERMAN;
			System.out.println(locales);
		}

		return "home";

	}
}


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