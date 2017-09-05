package com.controller.stay;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.stay.StayDTO;
import com.exception.MyException;
import com.service.stay.StayService;

@WebServlet("/StayRetrieveServlet")
public class StayRetrieveServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String staynum = request.getParameter("staynum");
		StayService service = new StayService();
		String target="stay/stay_retrieveview.jsp";
		try {
			StayDTO staydto = service.stayselectByNum(Integer.parseInt(staynum));
			request.setAttribute("retrieve", staydto);
		} catch (MyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			target = "error.jsp";
		}
		
		 RequestDispatcher dis = request.getRequestDispatcher(target);
		 dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
