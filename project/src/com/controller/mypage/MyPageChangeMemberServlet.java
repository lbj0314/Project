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
import com.dto.login.EntDTO;
import com.exception.MyException;
import com.service.login.LoginService;

@WebServlet("/MyPageChangeMemberServlet")
public class MyPageChangeMemberServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		LoginService service = new LoginService();
		String target = "";
		if(session.getAttribute("comLogin")!=null) {
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
		

		
		try {
			service.comChange(comdto);
			target = "mypage/mypage.jsp";
		} catch (MyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			target="error.jsp";
		}
		}
		if(session.getAttribute("entLogin")!=null) {
			EntDTO entdto = (EntDTO)session.getAttribute("entLogin");
			String entpasswd = request.getParameter("entpasswd");
			String entname = request.getParameter("entname");
			String entlocation = request.getParameter("entlocation");
			long entphone = Long.parseLong(request.getParameter("entphone"));
			long entcellphone = Long.parseLong(request.getParameter("entcellphone"));
			int entfax = Integer.parseInt(request.getParameter("entfax"));
			int entin = Integer.parseInt(request.getParameter("entin"));
			String enttype = request.getParameter("enttype");
			entdto.setEntpasswd(entpasswd);
			entdto.setEntname(entname);
			entdto.setEntlocation(entlocation);
			entdto.setEntphone(entphone);
			entdto.setEntcellphone(entcellphone);
			entdto.setEntfax(entfax);
			entdto.setEntin(entin);
			entdto.setEnttype(enttype);
			try {
				service.entChange(entdto);
				target = "mypage/mypage.jsp";
			} catch (MyException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				target="error.jsp";
			}
		}
		request.setAttribute("member", "member");
		RequestDispatcher dis = request.getRequestDispatcher(target);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
