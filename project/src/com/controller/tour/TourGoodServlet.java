package com.controller.tour;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.tour.TourDTO;
import com.exception.MyException;
import com.service.notice.NoticeService;
import com.service.tour.TourService;


/**
 * Servlet implementation class MyBoardDeleteServlet
 */
@WebServlet("/TourGoodServlet")
public class TourGoodServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String attNum = request.getParameter("attNum");
		TourService service = new TourService();
		//System.out.println(attNum);
		
		
		String target ="tour/tourGoods.jsp";
		try {
			service.goodsTour(Integer.parseInt(attNum));
			TourDTO dto = service.selectByTourNum(Integer.parseInt(attNum));
			int cnt = dto.getAttGoods();
			request.setAttribute("cnt", cnt);
		} catch (MyException e) {
			//target ="error.jsp";
			request.setAttribute("gooderror", "좋아요 실패");
		}
		
		RequestDispatcher dis = request.getRequestDispatcher(target);
		dis.forward(request, response);
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
