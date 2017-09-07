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

@WebServlet("/MyPageChangeMemberServlet")
public class MyPageChangeMemberServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ComDTO comdto = (ComDTO)session.getAttribute("comLogin");
		String compasswd = request.getParameter("compasswd");
		String comname = request.getParameter("comname");
		String comphone = request.getParameter("comphone");
		String comemail = request.getParameter("comemail");
		String comaddr1 = request.getParameter("comaddr1");
		String comaddr2 = request.getParameter("comaddr2");
		String compost1 = request.getParameter("post1");
		String compost2 = request.getParameter("post2");
		comdto.setCompasswd(compasswd);
		comdto.setComname(comname);
		comdto.setComphone(Long.parseLong(comphone));
		comdto.setComemail(comemail);
		comdto.setComaddr1(comaddr1);
		comdto.setComaddr2(comaddr2);
		comdto.setCompost1(Integer.parseInt(compost1));
		comdto.setCompost2(Integer.parseInt(compost2));
		LoginService service = new LoginService();
		String target = "";
		
		try {
			service.comChange(comdto);
			target = "mypage/mypage.jsp";
			request.setAttribute("member", "member");
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
