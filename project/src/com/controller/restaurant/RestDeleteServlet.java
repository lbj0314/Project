package com.controller.restaurant;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exception.MyException;
import com.service.restaurant.RestService;

@WebServlet("/RestDeleteServlet")
public class RestDeleteServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String restnum = request.getParameter("restnum");
		RestService service = new RestService();
		String target ="NoticeListServlet";
		try {
			service.restdeleteByNum(Integer.parseInt(restnum));

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
