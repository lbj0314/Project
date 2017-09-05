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
		
	
		String staytitle = request.getParameter("staytitle");
		String staycontent = request.getParameter("staycontent");
		
		StayDTO staydto = new StayDTO();
		staydto.setstaytitle(staytitle);
		staydto.setstaycontent(staycontent);
		
		StayService service = new StayService();
		String target="StayListServlet";
		try {
			service.stayboardWrite(staydto);
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





