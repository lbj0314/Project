package com.controller.ms;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MesCont {

	private MessageSource messages;

	@Autowired
	public void setMessages(MessageSource messages) {
		this.messages = messages;
	}

	@RequestMapping("/setChangeLocale.do")
	public String aaa(@RequestParam(required = false) String locale) {
	/*	String message = this.messages.getMessage("spring.mesg",
				null, "Required", Locale.KOREA);
		System.out.println(message);*/
		
		Locale locales = null;
		if (locale.matches("ko")) {
			 locales = Locale.KOREAN;
			 } else {
			 locales = Locale.ENGLISH;
			 }
			
	
		return "home";

	}
}


/*public class MesCont {
	 @RequestMapping(value = "/setChangeLocale.do")
	 public String changeLocale(@RequestParam(required = false) String locale,) {
	 HttpSession session = request.getSession();
	 Locale locales = null;
	 // 넘어온 파라미터에 ko가 있으면 Locale의 언어를 한국어로 바꿔준다.
	 // 그렇지 않을 경우 영어로 설정한다.
	 if (locale.matches("ko")) {
	 locales = Locale.KOREAN;
	 } else {
	 locales = Locale.ENGLISH;
	 }
	
	 // 해당 컨트롤러에게 요청을 보낸 주소로 돌아간다.
	 String redirectURL = "redirect:" + request.getHeader("referer");
	 return redirectURL;
	 }
}
*/
	
/*public class MesCont {

	private MessageSource messages;

	@Autowired
	public void setMessages(MessageSource messages) {
		this.messages = messages;
	}

	@RequestMapping("/setChangeLocale.do")
	public String aaa() {
		String message = this.messages.getMessage("spring.mesg",
				null, "Required", Locale.KOREA);
		System.out.println(message);
	
		return "home";

	}
}*/
