package com.controller.stay;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.stay.StayPageDTO;
import com.exception.MyException;
import com.service.stay.StayService;


@WebServlet("/StayBoardListServlet")
public class StayBoardListServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

				String stayCurpage = request.getParameter("stayCurpage");
				if(stayCurpage == null) {
					stayCurpage = "1";
				}
	
		String staySearchName = request.getParameter( "staySearchName" );
		String staySearchValue = request.getParameter( "staySearchValue" );
		String stayLocation=request.getParameter("stayLocation");
		String stayType=request.getParameter("stayType");
		String sortStay = request.getParameter("sortStay");
		String target="stay/stay_listview.jsp";

		 HashMap<String, String> map = new HashMap<>();
		 map.put("staySearchName", staySearchName);
		 map.put("staySearchValue", staySearchValue);
		 map.put("stayLocation", stayLocation);
		 map.put("stayType", stayType);
		 map.put("sortStay", sortStay);
		StayService service = new StayService();
		try {
			StayPageDTO list=service.stayPage(Integer.parseInt(stayCurpage),map);
			request.setAttribute("staylist", list);
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
