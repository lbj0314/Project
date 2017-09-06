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

@WebServlet("/StayWriteServlet")
public class StayWriteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
	
		String stayTitle = request.getParameter("stayTitle");
		String stayContent = request.getParameter("stayContent");
		
		StayDTO staydto = new StayDTO();
		staydto.setStayTitle(stayTitle);
		staydto.setStayContent(stayContent);
		
		StayService service = new StayService();
		String target="StayListServlet";
		try {
			service.stayBoardWrite(staydto);
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





