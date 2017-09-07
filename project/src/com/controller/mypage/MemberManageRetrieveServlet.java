package com.controller.mypage;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.login.ComDTO;
import com.dto.login.EntDTO;
import com.exception.MyException;
import com.service.login.LoginService;

@WebServlet("/MemberManageRetrieveServlet")
public class MemberManageRetrieveServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String category = request.getParameter("category");
		String userid = request.getParameter("userid");
		HashMap<String, String> map = new HashMap<>();
		map.put("userid", userid);
		LoginService service = new LoginService();
		HttpSession session = request.getSession();
		if(category.equals("com")) {
		try {
			ComDTO comdto = service.comLogin(map);
			session.setAttribute("comdto", comdto);
		} catch (MyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}else {
			try {
				EntDTO entdto = service.entLogin(map);
				session.setAttribute("entdto", entdto);
			} catch (MyException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		request.setAttribute("memberAfter", "memberAfter");
		String target = "mypage/mypageAfter.jsp";
		RequestDispatcher dis = request.getRequestDispatcher(target);
		dis.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
