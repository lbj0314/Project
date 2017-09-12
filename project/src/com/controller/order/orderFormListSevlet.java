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
		
		String attAdd = request.getParameter("attAdd");
		String resAdd = request.getParameter("resAdd");
		String stayAdd = request.getParameter("stayAdd");
		if(attAdd!=null) {
			request.setAttribute("attList", "attList");
		}
		if(resAdd!=null) {
			request.setAttribute("resList", "resList");
		}
		if(stayAdd!=null) {
			request.setAttribute("stayList", "stayList");
		}
		String target="order/orderForm.jsp";
		RequestDispatcher dis = request.getRequestDispatcher(target);
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
