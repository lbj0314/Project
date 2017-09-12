package com.controller.order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/orderFormListSevlet")
public class orderFormListSevlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String kind = request.getParameter("kind");
		
		System.out.println(kind);

		if(kind.equals("attAdd")) {
			request.setAttribute("attList", "attList");
		}
		if(kind.equals("resAdd")) {
			request.setAttribute("resList", "resList");
		}
		if(kind.equals("stayAdd")) {
			request.setAttribute("stayList", "stayList");
		}
		String target="TourListServlet";
		request.setAttribute("orderList", "orderList");
		RequestDispatcher dis = request.getRequestDispatcher(target);
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
