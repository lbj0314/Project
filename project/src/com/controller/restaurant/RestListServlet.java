package com.controller.restaurant;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.restaurant.RestPageDTO;
import com.dto.tour.TourDTO;
import com.dto.tour.TourPageDTO;
import com.exception.MyException;
import com.service.restaurant.RestService;
import com.service.tour.TourService;


@WebServlet("/RestListServlet")
public class RestListServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		// list.jsp에서   1  2  3  4
				String curPage = request.getParameter("curPage");
				if(curPage == null) {
					curPage = "1";
				}
		//String cc="1";
		//String dd = "2";
		String searchName = request.getParameter( "searchName" );
		String searchValue = request.getParameter( "searchValue" );
		String restLocation=request.getParameter("restLocation");
		String restType=request.getParameter("restType");
		
		String sortRest = request.getParameter("sortRest");
	/*	
		System.out.println("al"+attLocation);
		System.out.println("at"+attType);*/
		
		
		String target="restaurant/restListView.jsp";
		
		
		
		//String dd = request.getParameter("dd");
		//if(dd==null) dd="2";
		//System.out.println("!!!!"+cc);
		//System.out.println(aa);
		//System.out.println(bb);
		
		
		
		
		
	
		 HashMap<String, String> map = new HashMap<>();
		 map.put("searchName", searchName);
		 map.put("searchValue", searchValue);
		 map.put("restLocation", restLocation);
		 map.put("restType", restType);
		 map.put("sortRest", sortRest);
		
		RestService service = new RestService();
		
		if(!(searchValue == null)) {
			target="restaurant/restListView.jsp";
			
		}
		
		else if(!(restLocation == null) || !(searchName == null) ||  !(restType == null) || !(sortRest == null)) {
			target="restaurant/restAjax.jsp";
			
			
			
		}
		
		try {
			RestPageDTO list=service.page(Integer.parseInt(curPage),map);
			request.setAttribute("restlist", list);
		} catch (MyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			target="error.jsp";
			
		}
		

		
		if(request.getAttribute("orderList")!=null) {
			target="order/orderForm.jsp";
		}

		RequestDispatcher dis = request.getRequestDispatcher(target);
		dis.forward(request, response);

		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
