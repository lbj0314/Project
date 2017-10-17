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

	@RequestMapping("/aaa")
	public String aaaa() {
		String message = this.messages.getMessage("spring.mesg", 
				new String[] { "one", "two" }, "Required",
				Locale.KOREA);
		System.out.println(message);
		String message2 = this.messages.getMessage("spring.mesg", 
				new String[] { "one", "two" }, "Required", Locale.US);
		System.out.println(message2);
		return "home";
	}

}
