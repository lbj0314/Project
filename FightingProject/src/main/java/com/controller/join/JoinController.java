package com.controller.join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.login.AdmDTO;
import com.dto.login.ComDTO;
import com.dto.login.EntDTO;
import com.service.JoinService;

@Controller
public class JoinController {

	@Autowired
	JoinService service;
	
	@RequestMapping("/joinForm")
	public String joinForm() {
		return "join/joinForm";
	}
	@RequestMapping("/join2")
	public String join2(@RequestParam String name, String userid,
			String passwd, String ssn, String phone1, String email, String addr1,
			String addr2, String post1, String post2) {
		
			ComDTO dto = new ComDTO(userid, passwd, name, Long.parseLong(ssn), Long.parseLong(phone1),
					email, addr1, addr2, Integer.parseInt(post1), Integer.parseInt(post2));
			try {
			service.comJoin(dto);
			}catch(Exception e) {
				e.printStackTrace();
			}
			return "home";
	}
	
		@RequestMapping("/join3")
		public String join3(@RequestParam String name, String userid,
				String passwd, String ssn, String phone1, String email, String addr1,
				String addr2, String post1, String post2, String location, String phone2,
				String fax, String in, String kind) {
				
				EntDTO dto = new EntDTO(userid, passwd, name, location, Long.parseLong(phone2), 
						Long.parseLong(phone1), Long.parseLong(fax), Long.parseLong(in), kind);
				service.entJoin(dto);

		return "home";
		}
		
		@RequestMapping("/comJoinView")
		public String comJoinView() {
			return "join/joinForm/comJoin";
		}
		@RequestMapping("/entJoinView")
		public String entJoinView() {
			return "join/joinForm/entJoin";
		}
	}
	/*@RequestMapping("/join")
	public String join(@RequestParam String category, String name, String userid,
			String passwd, String ssn, String phone1, String email, String addr1,
			String addr2, String post1, String post2, String location, String phone2,
			String fax, String in, String kind) {
		
		if(category.equals("com")) {
			ComDTO dto = new ComDTO(userid, passwd, name, Long.parseLong(ssn), Long.parseLong(phone1),
					email, addr1, addr2, Integer.parseInt(post1), Integer.parseInt(post2));
			try {
			service.comJoin(dto);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}else if(category.equals("ent")){
			EntDTO dto = new EntDTO(userid, passwd, name, location, Long.parseLong(phone2), 
					Long.parseLong(phone1), Integer.parseInt(fax), Integer.parseInt(in), kind);
			service.entJoin(dto);
		}else {
			AdmDTO dto = new AdmDTO(userid, passwd);
			service.admJoin(dto);
		}
		return "home";
	}
	
	
	
}
*/