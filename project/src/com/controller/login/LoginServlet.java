package com.controller.login;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.login.AdmDTO;
import com.dto.login.ComDTO;
import com.dto.login.EntDTO;
import com.exception.MyException;
import com.service.login.LoginService;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String wholog = request.getParameter("wholog");
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		HashMap<String, String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("passwd", passwd);
		LoginService service = new LoginService();
		HttpSession session = request.getSession();
		String target = null;
		if (wholog.equals("com")) {
			try {
				
				ComDTO dto = service.comLogin(map);
				if(dto==null) {
					target="error.jsp";
				}else {
				session.setAttribute("login", dto);
				target="login/comLogin.jsp";
				}
			} catch (MyException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		if (wholog.equals("adm")) {
			try {
				AdmDTO dto = service.admLogin(map);
				if(dto==null) {
					target="error.jsp";
				}else {
				session.setAttribute("login", dto);
				target="login/admLogin.jsp";
				}
			} catch (MyException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (wholog.equals("ent")) {
			try {
				EntDTO dto = service.entLogin(map);
				if(dto==null) {
					target="error.jsp";
				}else {
				session.setAttribute("login", dto);
				target="login/entLogin.jsp";
				}
			} catch (MyException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		RequestDispatcher dis = request.getRequestDispatcher(target);
		dis.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
