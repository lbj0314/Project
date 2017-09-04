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
 * Servlet implementation class MyBoardUpdateServlet
 */
@WebServlet("/NoticeUpdateServlet")
public class NoticeUpdateServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String nonum = request.getParameter("num");
		String notitle = request.getParameter("title");
		String nocontent = request.getParameter("content");
		
		NoticeDTO dto = new NoticeDTO();
		dto.setNonum(Integer.parseInt(nonum));
		dto.setNotitle(notitle);
		dto.setNocontent(nocontent);
		
		NoticeService service = new NoticeService();
		String target ="NoticeListServlet";
		try {
			service.updateByNum(dto);

		} catch (MyException e) {
			target ="error.jsp";
		}
		
		response.sendRedirect(target);
		
		
	}//end 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
