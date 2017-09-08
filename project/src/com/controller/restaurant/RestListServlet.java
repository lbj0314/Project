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


@WebServlet("/RestistServlet")
public class RestListServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
				String restCurPage = request.getParameter("restCurPage");
				if(restCurPage == null) {
					restCurPage = "1";
				}
		String restSearchName = request.getParameter( "restSearchName" );
		String restSearchValue = request.getParameter( "restSearchValue" );
		String restLocation=request.getParameter("restLocation");
		String restType=request.getParameter("restType");
		String sortRest = request.getParameter("sortRest");	
		String target="restaurant/rest_listView.jsp";
		
		 HashMap<String, String> map = new HashMap<>();
		 map.put("restSearchName", restSearchName);
		 map.put("restSearchValue", restSearchValue);
		 map.put("restLocation", restLocation);
		 map.put("restType", restType);
		 map.put("sortRest", sortRest);
		
		RestService service = new RestService();

		try {
			RestPageDTO list=service.restPage(Integer.parseInt(restCurPage),map);
			request.setAttribute("restlist", list);
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