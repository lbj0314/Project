package com.controller.tour;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exception.MyException;
import com.service.notice.NoticeService;
import com.service.tour.TourService;


/**
 * Servlet implementation class MyBoardDeleteServlet
 */
@WebServlet("/TourDeleteServlet")
public class TourDeleteServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String attNum = request.getParameter("attNum");
		TourService service = new TourService();
		String target ="TourListServlet";
	
		try {
			service.deleteByTourNum(Integer.parseInt(attNum));
			request.setAttribute("deleok", "삭제 성공");
		} catch (MyException e) {
			target ="error.jsp";
			request.setAttribute("deleerr", "삭제 실패");
		}
		
		response.sendRedirect(target);
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
