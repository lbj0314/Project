package com.controller.order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.restaurant.RestDTO;
import com.dto.stay.StayDTO;
import com.dto.tour.TourDTO;
import com.exception.MyException;
import com.service.restaurant.RestService;
import com.service.stay.StayService;
import com.service.tour.TourService;

@WebServlet("/orderFormServlet")
public class orderFormServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String attNum = request.getParameter("attNum");
		String stayNum = request.getParameter("stayNum");
		String resNum = request.getParameter("restNum");

		HttpSession session = request.getSession();

		if(attNum!=null) {
			try {
				TourService service = new TourService();
				TourDTO attDto = service.selectByTourNumTwo(Integer.parseInt(attNum));
				request.setAttribute("attDto", attDto);
			}catch (MyException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(stayNum!=null) {
			try {
				StayService service = new StayService();
				StayDTO stayDto = service.staySelectByNumTwo(Integer.parseInt(stayNum));
				request.setAttribute("stayDto", stayDto);
			}catch (MyException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(resNum!=null) {
			try {
				RestService service = new RestService();
				RestDTO resDto = service.selectByRestNumTwo(Integer.parseInt(resNum));
				request.setAttribute("resDto", resDto);
			}catch (MyException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		String target = "order/orderForm.jsp";
		RequestDispatcher dis = request.getRequestDispatcher(target);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
