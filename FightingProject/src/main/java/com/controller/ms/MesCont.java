package com.controller.ms;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MesCont {

	private MessageSource messages;

	@Autowired
	public void setMessages(MessageSource messages) {
		this.messages = messages;
	}

	@RequestMapping("/kr")
	public String kr() {
		String message = this.messages.getMessage("spring.mesg", 
				new String[] { "마음에 드는 숙박, 음식점, 관광명소를 선택하신 후", "자유롭게 패키지를 설정하실 수 있습니다" }, "Required",
				Locale.KOREA);
		System.out.println(message);
		return "guide";
	}
	
	@RequestMapping("/us")
	public String us() {
		String message2 = this.messages.getMessage("spring.mesg", 
				new String[] { "you can make", "own your own package" }, "Required", Locale.US);
		System.out.println(message2);
		return "guide";
	}
	
	@RequestMapping("/ch")
	public String ch() {
		String message2 = this.messages.getMessage("spring.mesg", 
				new String[] { "糖醋猪肉", "我想吃" }, "Required", Locale.CHINA);
		System.out.println(message2);
		return "guide";
	}
	

}
