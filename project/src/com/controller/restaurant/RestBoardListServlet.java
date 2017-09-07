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
		
		request.setCharacterEncoding("UTF-8");
				String restCurPage = request.getParameter("restCurPage");
				if(restCurPage == null) {
					restCurPage = "1";
				}
		String restSearchName = request.getParameter( "restSearchName" );
		String restSearchValue = request.getParameter( "restSearchValue" );
		String restLocation=request.getParameter("restLocation");
		String restType=request.getParameter("restType");
		String restBtngo = request.getParameter("restBtngo");
		String restBtn = request.getParameter("restBtn");
		if(restBtn==null) restBtn="1";
		
		
		System.out.println("att"+restBtn);
		String target="restaurant/rest_listboardview.jsp";
		 HashMap<String, String> map = new HashMap<>();
		 map.put("restSearchName", restSearchName);
		 map.put("restSearchValue", restSearchValue);
		 map.put("restLocation", restLocation);
		 map.put("restType", restType);
		 
		if(restBtn.equals("1")) {
			map.put("restBtn", "1");

			 
		 }
		 else if(restBtn.equals("cc")) {
			 map.put("restBtn", "cc");
		 }
		else if(restBtn.equals("dd")) {
			 map.put("restBtn", "dd");
			 
		 }
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
