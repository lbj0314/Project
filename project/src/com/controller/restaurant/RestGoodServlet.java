package com.controller.restaurant;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.restaurant.RestDTO;
import com.dto.tour.TourDTO;
import com.exception.MyException;
import com.service.notice.NoticeService;
import com.service.restaurant.RestService;
import com.service.tour.TourService;


/**
 * Servlet implementation class MyBoardDeleteServlet
 */
@WebServlet("/RestGoodServlet")
public class RestGoodServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String restNum = request.getParameter("restNum");
		RestService service = new RestService();
		//System.out.println(attNum);
		
		
		String target ="restaurant/restGoods.jsp";
		try {
			service.goodsRest(Integer.parseInt(restNum));
			RestDTO dto = service.selectByRestNum(Integer.parseInt(restNum));
			int cnt = dto.getRestGoods();
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
