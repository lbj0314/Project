package com.controller.join;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.login.AdmDTO;
import com.dto.login.ComDTO;
import com.dto.login.EntDTO;

@WebServlet("/JoinServlet")
public class JoinServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String category = request.getParameter("category");
		String name = request.getParameter("name");
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		String ssn = request.getParameter("ssn");
		String phone1 = request.getParameter("phone1");
		String email = request.getParameter("email");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String post1 = request.getParameter("post1");
		String post2 = request.getParameter("post2");
		String location = request.getParameter("location");
		String phone2 = request.getParameter("phone2");
		String fax = request.getParameter("fax");
		String in = request.getParameter("in");
		String kind = request.getParameter("kind");
		if(category.equals("adm")) {
			AdmDTO dto = new AdmDTO(userid, passwd);
			
		}else if(category.equals("com")) {
			ComDTO dto = new ComDTO(userid, passwd, name, Integer.parseInt(ssn), Integer.parseInt(phone1),
					email, addr1, addr2, Integer.parseInt(post1), Integer.parseInt(post2));
			
		}else {
			EntDTO dto = new EntDTO(userid, passwd, name, location, Integer.parseInt(phone2), 
					Integer.parseInt(phone1), Integer.parseInt(fax), Integer.parseInt(in), kind);
			
		}
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
