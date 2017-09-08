package com.controller.stay;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exception.MyException;
import com.service.stay.StayService;


/**
 * Servlet implementation class MyBoardDeleteServlet
 */
@WebServlet("/StayGoodServlet")
public class StayGoodServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String stayNum = request.getParameter("stayNum");
		StayService service = new StayService();
		String target ="StayRetrieveServlet?stayNum="+stayNum;
		try {
			service.stayGoods(Integer.parseInt(stayNum));
			request.setAttribute("goodok", "좋아요 성공");
		} catch (MyException e) {
			target ="error.jsp";
			request.setAttribute("gooderror", "좋아요 실패");
		}
		response.sendRedirect(target);

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
