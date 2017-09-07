package com.controller.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.login.ComDTO;
import com.exception.MyException;
import com.service.login.LoginService;

@WebServlet("/MyPageLeaveMemberServlet")
public class MyPageLeaveMemberServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginService service = new LoginService();
		HttpSession session = request.getSession();
		ComDTO dto = (ComDTO)session.getAttribute("comLogin");
		int comnum = dto.getComnum();
		String target="";
		try {			service.comDelete(comnum);
			target="home.jsp";
			session.invalidate();
		} catch (MyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			target="error.jsp";
		}
		RequestDispatcher dis = request.getRequestDispatcher(target);
		dis.forward(request, response);
		 
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
