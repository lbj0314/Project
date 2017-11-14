package com.controller.oauth;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.UserProfile;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.google.connect.GoogleServiceProvider;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GoogleLoginController {
	
	
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	
	
	
	

	
	
	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/**")
	public String login(Model model) {

		 //구글code 발행 
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		System.out.println("구글:" + url);

		model.addAttribute("google_url", url);
		//session.invalidate();
		// 생성한 인증 URL을 View로 전달 
		return "home";
	}

	// 구글 Callback호출 메소드
	@RequestMapping(value = "/oauth2callback")
	public String googleCallback(HttpSession session, @RequestParam String code,Model m) throws IOException {
		
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code , googleOAuth2Parameters.getRedirectUri(),
				null);
		

		String accessToken = accessGrant.getAccessToken();
		
		Long expireTime = accessGrant.getExpireTime();
		
		if (expireTime != null && expireTime < System.currentTimeMillis()) {
			
			accessToken = accessGrant.getRefreshToken();
			System.out.println("6");
			System.out.println("accessToken is expired. refresh token = {}"+ accessToken);
		}
		
		Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
		
		Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
		
		 System.out.println(connection.getApi());
		PlusOperations plusOperations = google.plusOperations();
		//System.out.println(">!"+plusOperations);
		
		m.addAttribute("aa",1);
		
		
		
		session.setAttribute("google","안녕하세요 구글 및 네이버 로그인은 로그인만 가능합니다.");
		
		
		
		
		
		
		
		
		
		//System.out.println(person.get);
		System.out.println("여기는 googleCallback");
	
		
		return "home";
	}
	
	@RequestMapping(value = "/googleLogout")
	public String googleLogout(HttpSession session) {
		
		
		
		session.invalidate();
		
		return "redirect:/";
		
	}

   


}
