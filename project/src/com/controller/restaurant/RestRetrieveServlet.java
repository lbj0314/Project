package com.controller.restaurant;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.restaurant.RestDTO;
import com.exception.MyException;
import com.service.restaurant.RestService;

@WebServlet("/RestRetrieveServlet")
public class RestRetrieveServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String restnum = request.getParameter("restnum");
		RestService service = new RestService();
		String target="rest/rest_retrieveview.jsp";
		try {
			RestDTO restdto = service.restselectByNum(Integer.parseInt(restnum));
			request.setAttribute("retrieve", restdto);
		} catch (MyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			target = "error.jsp";
		}
		
		 RequestDispatcher dis = request.getRequestDispatcher(target);
		 dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
