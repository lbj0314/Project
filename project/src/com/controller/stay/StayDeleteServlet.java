package com.controller.stay;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exception.MyException;
import com.service.stay.StayService;

@WebServlet("/StayDeleteServlet")
public class StayDeleteServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String stayNum = request.getParameter("stayNum");
		StayService service = new StayService();
		String target ="StayListServlet";
		try {
			service.stayDeleteByNum(Integer.parseInt(stayNum));

		} catch (MyException e) {
			target ="error.jsp";
		}
		response.sendRedirect(target);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
