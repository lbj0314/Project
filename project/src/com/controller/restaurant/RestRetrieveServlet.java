package com.controller.restaurant;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.restaurant.RestDTO;
import com.exception.MyException;
import com.service.restaurant.RestService;


@WebServlet("/RestRetrieveServlet")
public class RestRetrieveServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String restNum = request.getParameter("restNum");
		RestService service = new RestService();
		 String restTitle="";
		    String target="";
		try {
			List<RestDTO> dto = service.restRetrieve(restNum);
			target = "restaurant/rest_boardretrieve.jsp";
			request.setAttribute("RestDTO", dto);
		} catch (MyException e) {
			restTitle= e.getMessage();
			String link="home.jsp";
			target="error.jsp";
			request.setAttribute("restTitle", restTitle);
			request.setAttribute("link", link);
		}
		
		RequestDispatcher dis =
	request.getRequestDispatcher(target);
		dis.forward(request, response);
	}//end 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}