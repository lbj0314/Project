package com.controller.oauth;

/*import java.io.IOException;

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
public class LoginController {
	
	 GoogleLogin 
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;

	

	
	
	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/login")
	public String login(Model model) {

		 구글code 발행 
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		System.out.println("구글:" + url);

		model.addAttribute("google_url", url);
		//session.invalidate();
		 생성한 인증 URL을 View로 전달 
		return "login";
	}

	// 구글 Callback호출 메소드
	@RequestMapping(value = "/oauth2callback")
	public String googleCallback(Model model, @RequestParam String code) throws IOException {
		
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code , googleOAuth2Parameters.getRedirectUri(),
				null);
		System.out.println("!!!"+oauthOperations);
		System.out.println("+++"+code);
		System.out.println(accessGrant);

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
		Person person =new Person();
		person = plusOperations.getPerson(code);
		System.out.println("?"+person);
		
		
		
		
		
		
		
		
		
		
		
		
		//accessGrant.
		System.out.println(person.getId());
		System.out.println("1");	
		System.out.println(person.getDisplayName());
		System.out.println("2");	
		//System.out.println(person.getEmailAddresses());
		System.out.println(person.getOccupation());
		System.out.println(person.getEmails());
		System.out.println(person.getAccountEmail());
		System.out.println(person.getGender());
		System.out.println("3");	
	
		//System.out.println(person.getEmails().toString());
		System.out.println(person.getGivenName());
		System.out.println("6");	
		//System.out.println(person.getEmailAddresses().toString());
		
		//System.out.println(person.get);
		System.out.println("여기는 googleCallback");
	
		model.addAttribute("result",person);
		return "googleSuccess";
	}

    @Override
    protected String extractProviderUserId(AccessGrant accessGrant) {
        Google api = ((GoogleServiceProvider)getServiceProvider()).getApi(accessGrant.getAccessToken());
        UserProfile userProfile = getApiAdapter().fetchUserProfile(api);
        return userProfile.getUsername();
    }


}
*/