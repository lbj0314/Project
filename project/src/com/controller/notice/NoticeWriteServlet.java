package com.controller.notice;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.notice.NoticeDTO;
import com.exception.MyException;
import com.service.notice.NoticeService;


/**
 * Servlet implementation class MyBoardWriteServlet
 */
@WebServlet("/NoticeWriteServlet")
public class NoticeWriteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
	
		String notitle = request.getParameter("title");
		String nocontent = request.getParameter("content");
		
		NoticeDTO dto = new NoticeDTO();
		dto.setNotitle(notitle);
		dto.setNocontent(nocontent);
		
		NoticeService service = new NoticeService();
		String target="NoticeListServlet";
		try {
			service.boardWrite(dto);
		} catch (MyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			target="error.jsp";
		}
		
		response.sendRedirect(target);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}





