package com.controller.stay;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.stay.StayPageDTO;

@WebServlet("/StayPerPageServlet")
public class StayPerPageServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String stayperPage = request.getParameter("stayperPage");
		if (stayperPage.equals("def"))
			stayperPage = "3";
		System.out.println(stayperPage);
		StayPageDTO.setstayperPage(Integer.parseInt(stayperPage));
		String target = "StayListServlet";
		RequestDispatcher dis = request.getRequestDispatcher(target);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
