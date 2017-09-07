package com.controller.stay;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.stay.StayDTO;
import com.exception.MyException;
import com.service.stay.StayService;

@WebServlet("/StayUpdateServlet")
public class StayUpdateServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String stayNum = request.getParameter("stayNum");
		String stayTitle = request.getParameter("stayTitle");
		String stayContent = request.getParameter("stayContent");
		StayDTO staydto = new StayDTO();
		staydto.setStayNum(Integer.parseInt(stayNum));
		staydto.setStayTitle(stayTitle);
		staydto.setStayContent(stayContent);

		StayService service = new StayService();
		String target = "StayListServlet";
		try {
			service.stayUpdateByNum(staydto);

		} catch (MyException e) {
			target = "error.jsp";
		}
		response.sendRedirect(target);
	}// end

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
