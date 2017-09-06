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
import com.service.tour.TourService;


@WebServlet("/TourRetrieveServlet")
public class TourRetrieveServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	String attNum = request.getParameter("attNum");
		
		TourService service = new TourService();
		String target="tour/tourRetrieve.jsp";
		try {
			TourDTO dto = service.selectByTourNum(Integer.parseInt(attNum));
			request.setAttribute("tourRetrieve", dto);
			
		} catch (MyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			target="error.jsp";
		}
		
		RequestDispatcher dis = request.getRequestDispatcher(target);
		dis.forward(request, response);
		
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
