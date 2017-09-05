package com.controller.restaurant;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.restaurant.RestPageDTO;
import com.exception.MyException;
import com.service.restaurant.RestService;


@WebServlet("/RestListServlet")
public class RestListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String restcurPage = request.getParameter("restcurPage");
		if(restcurPage == null) {
			restcurPage = "1";
		}
		
		String restsearchName = request.getParameter( "restsearchName" );
		String restsearchValue = request.getParameter( "restsearchValue" );

		 HashMap<String, String> restmap = new HashMap<>();
		 restmap.put("restsearchName", restsearchName);
		 restmap.put("restsearchValue", restsearchValue);
		 
		 RestService service = new RestService();
		 String target = "restaurant/rest_listview.jsp";
		 try {
			 RestPageDTO list = service.restpage(Integer.parseInt(restcurPage), restmap);
			request.setAttribute("list", list);
	
		} catch (MyException e) {
			target = "error.jsp";
		}
		
		 RequestDispatcher dis = request.getRequestDispatcher(target);
		 dis.forward(request, response);
	}//end 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}