package com.controller.notice;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.notice.PageDTO;
import com.exception.MyException;
import com.service.notice.NoticeService;


/**
 * Servlet implementation class MyBoardListServlet
 */
@WebServlet("/NoticeListServlet")
public class NoticeListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// list.jsp에서   1  2  3  4
		String curPage = request.getParameter("curPage");
		if(curPage == null) {
			curPage = "1";
		}
		
		String searchName = request.getParameter( "searchName" );
		String searchValue = request.getParameter( "searchValue" );

		 HashMap<String, String> map = new HashMap<>();
		 map.put("searchName", searchName);
		 map.put("searchValue", searchValue);
		 
		 NoticeService service = new NoticeService();
		 String target = "list.jsp";
		 try {
			 PageDTO list = service.page(Integer.parseInt(curPage), map);
			 System.out.println(list.getList());
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







