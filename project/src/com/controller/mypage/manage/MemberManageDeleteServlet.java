package com.controller.mypage.manage;

import java.io.IOException;

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

@WebServlet("/MemberManageDeleteServlet")
public class MemberManageDeleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String fax = request.getParameter("fax");
		HttpSession session = request.getSession();
		LoginService service = new LoginService();
		
		if (fax == null) {
			ComDTO comdto = (ComDTO) session.getAttribute("comdto");
			int comnum = comdto.getComnum();
			try {
				service.comDelete(comnum);
			} catch (MyException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("comDelete", comdto.getComname());	
			session.removeAttribute("comdto");
	
		} else {
			EntDTO entdto = (EntDTO)session.getAttribute("entdto");
			int entnum = entdto.getEntnum();
			try {
				service.entDelete(entnum);
			} catch (MyException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("entDelete", entdto.getEntname());	
			session.removeAttribute("entdto");
		
		}
		String target = "mypage/mypageAfter.jsp";
		request.setAttribute("afterDelete", "afterDelete");
		RequestDispatcher dis = request.getRequestDispatcher(target);
		dis.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
