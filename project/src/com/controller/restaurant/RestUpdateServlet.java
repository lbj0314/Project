package com.controller.restaurant;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.restaurant.RestDTO;
import com.exception.MyException;
import com.service.restaurant.RestService;

@WebServlet("/RestUpdateServlet")
public class RestUpdateServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String restNum = request.getParameter("restNum");
		String restTitle = request.getParameter("restTitle");
		String restContent = request.getParameter("restContent");
		RestDTO restdto = new RestDTO();
		restdto.setRestNum(Integer.parseInt(restNum));
		restdto.setRestTitle(restTitle);
		restdto.setRestContent(restContent);

		RestService service = new RestService();
		String target = "RestBoardListServlet";
		try {
			service.restUpdateByNum(restdto);

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
