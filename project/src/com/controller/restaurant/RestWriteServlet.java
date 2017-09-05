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

@WebServlet("/RestWriteServlet")
public class RestWriteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
	
		String resttitle = request.getParameter("resttitle");
		String restcontent = request.getParameter("restcontent");
		
		RestDTO restdto = new RestDTO();
		restdto.setResttitle(resttitle);
		restdto.setRestcontent(restcontent);
		
		RestService service = new RestService();
		String target="RestListServlet";
		try {
			service.restboardWrite(restdto);
		} catch (MyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			target="error.jsp";
		}
		
		response.sendRedirect(target);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}





