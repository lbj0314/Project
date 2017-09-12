package com.controller.order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.dto.tour.TourDTO;
import com.exception.MyException;
import com.service.tour.TourService;

@WebServlet("/orderFormServlet")
public class orderFormServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String attNum = request.getParameter("attNum");
		
		
		HttpSession session = request.getSession();
		TourService service = new TourService();
		if(attNum!=null) {
			try {
				TourDTO attDto = service.selectByTourNum(Integer.parseInt(attNum));
				request.setAttribute("attDto", attDto);
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
