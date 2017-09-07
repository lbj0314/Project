package com.controller.tour;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.tour.TourDTO;
import com.dto.tour.TourPageDTO;
import com.exception.MyException;

import com.service.tour.TourService;


@WebServlet("/TourListServlet")
public class TourListServlet extends HttpServlet {
	
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
		String attLocation=request.getParameter("attLocation");
		String attType=request.getParameter("attType");
		
		String sortAtt = request.getParameter("sortAtt");
	/*	
		System.out.println("al"+attLocation);
		System.out.println("at"+attType);*/
		
		
		String target="tour/tourListView.jsp";
		
		
		
		//String dd = request.getParameter("dd");
		//if(dd==null) dd="2";
		//System.out.println("!!!!"+cc);
		//System.out.println(aa);
		//System.out.println(bb);
		
		
		
		
		
	
		 HashMap<String, String> map = new HashMap<>();
		 map.put("searchName", searchName);
		 map.put("searchValue", searchValue);
		 map.put("attLocation", attLocation);
		 map.put("attType", attType);
		 map.put("sortAtt", sortAtt);
		
		TourService service = new TourService();
		
		 
		
		try {
			TourPageDTO list=service.page(Integer.parseInt(curPage),map);
			request.setAttribute("tourlist", list);
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
