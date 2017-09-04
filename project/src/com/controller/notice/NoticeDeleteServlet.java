package com.controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exception.MyException;
import com.service.notice.NoticeService;


/**
 * Servlet implementation class MyBoardDeleteServlet
 */
@WebServlet("/NoticeDeleteServlet")
public class NoticeDeleteServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nonum = request.getParameter("nonum");
		NoticeService service = new NoticeService();
		String target ="NoticeListServlet";
		try {
			service.deleteByNum(Integer.parseInt(nonum));

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
