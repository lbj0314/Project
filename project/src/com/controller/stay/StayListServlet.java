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

@WebServlet("/StayListServlet")
public class StayListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String stayCurPage = request.getParameter("stayCurPage");
		if(stayCurPage == null) {
			stayCurPage = "1";
		}
		
		String staySearchName = request.getParameter( "staySearchName" );
		String staySearchValue = request.getParameter( "staySearchValue" );

		 HashMap<String, String> staymap = new HashMap<>();
		 staymap.put("staySearchName", staySearchName);
		 staymap.put("staySearchValue", staySearchValue);
		 
		 StayService service = new StayService();
		 String target = "stay/stay_boardlistview.jsp";
		 try {
			 StayPageDTO list = service.stayPage(Integer.parseInt(stayCurPage), staymap);
			request.setAttribute("list", list);
	
		} catch (MyException e) {
			target = "error.jsp";
		}
		
		 RequestDispatcher dis = request.getRequestDispatcher(target);
		 dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
