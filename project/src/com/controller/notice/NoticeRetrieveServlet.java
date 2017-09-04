package com.controller.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.notice.NoticeDTO;
import com.exception.MyException;
import com.service.notice.NoticeService;


/**
 * Servlet implementation class MyBoardRetrieveServlet
 */
@WebServlet("/NoticeRetrieveServlet")
public class NoticeRetrieveServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nonum = request.getParameter("nonum");
		NoticeService service = new NoticeService();
		String target="retrieve.jsp";
		try {
			NoticeDTO dto = service.selectByNum(Integer.parseInt(nonum));
			request.setAttribute("retrieve", dto);
		} catch (MyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			target = "error.jsp";
		}
		
		 RequestDispatcher dis = request.getRequestDispatcher(target);
		 dis.forward(request, response);
		
	}//end 
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
