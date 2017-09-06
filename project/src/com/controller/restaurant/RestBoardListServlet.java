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


@WebServlet("/RestBoardListServlet")
public class RestBoardListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String restCurPage = request.getParameter("restCurPage");
		if(restCurPage == null) {
			restCurPage = "1";
		}
		
		String restSearchName = request.getParameter( "restSearchName" );
		String restSearchValue = request.getParameter( "restSearchValue" );

		 HashMap<String, String> restmap = new HashMap<>();
		 restmap.put("restSearchName", restSearchName);
		 restmap.put("restSearchValue", restSearchValue);
		 
		 RestService service = new RestService();
		 String target = "restaurant/rest_listview.jsp";
		 try {
			 RestPageDTO list = service.restpage(Integer.parseInt(restCurPage), restmap);
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