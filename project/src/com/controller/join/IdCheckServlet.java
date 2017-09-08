package com.controller.join;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.login.AdmDTO;
import com.dto.login.ComDTO;
import com.dto.login.EntDTO;
import com.exception.MyException;
import com.service.login.LoginService;

@WebServlet("/IdCheckServlet")
public class IdCheckServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		String userid = request.getParameter("userid");
		HashMap<String, String> map = new HashMap<>();
		map.put("userid", userid);
		LoginService service = new LoginService();
		String mesg="";
		if(category.equals("com")&&userid.length()!=0) {
			try {

				ComDTO dto = service.comLogin(map);
				if (dto == null) {
					mesg="사용가능한 아이디 입니다.";
				} else {
					mesg="이미 사용중인 아이디 입니다.";
				}
			} catch (MyException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(category.equals("adm")&&userid.length()!=0) {
			try {

				AdmDTO dto = service.admLogin(map);
				if (dto == null) {
					mesg="사용가능한 아이디 입니다.";
				} else {
					mesg="이미 사용중인 아이디 입니다.";
				}
			} catch (MyException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if (category.equals("ent")&&userid.length()!=0) {
			try {
				EntDTO dto = service.entLogin(map);
				if (dto == null) {
					mesg="사용가능한 아이디 입니다.";
				} else {
					mesg="이미 사용중인 아이디 입니다.";
				}
			} catch (MyException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(category.equals("ent")) {
			
		}
		String target="mesg/mesg.jsp";
		request.setAttribute("mesg", mesg);
		RequestDispatcher dis = request.getRequestDispatcher(target);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
