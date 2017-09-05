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
		String restnum = request.getParameter("restnum");
		String resttitle = request.getParameter("resttitle");
		String restcontent = request.getParameter("restcontent");
		RestDTO restdto = new RestDTO();
		restdto.setRestnum(Integer.parseInt(restnum));
		restdto.setResttitle(resttitle);
		restdto.setRestcontent(restcontent);

		RestService service = new RestService();
		String target = "RestListServlet";
		try {
			service.restupdateByNum(restdto);

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
