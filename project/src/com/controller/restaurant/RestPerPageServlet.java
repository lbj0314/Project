package com.controller.restaurant;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.restaurant.RestPageDTO;

@WebServlet("/RestPerPageServlet")
public class RestPerPageServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String restPerPage = request.getParameter("restPerPage");
		if (restPerPage.equals("def"))
			restPerPage = "3";
		System.out.println(restPerPage);
		RestPageDTO.setRestPerPage(Integer.parseInt(restPerPage));
		String target = "RestBoardListServlet";
		RequestDispatcher dis = request.getRequestDispatcher(target);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
