package com.controller.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.notice.PageDTO;


/**
 * Servlet implementation class MyBoardPerPageServlet
 */
@WebServlet("/NoticePerPageServlet")
public class NoticePerPageServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		 String perPage = request.getParameter("perPage");
		 if(perPage.equals("def")) perPage = "3";
		 System.out.println(perPage);
		 PageDTO.setPerPage(Integer.parseInt(perPage));
		 String target="NoticeListServlet";
		RequestDispatcher dis = request.getRequestDispatcher(target);
		 dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
