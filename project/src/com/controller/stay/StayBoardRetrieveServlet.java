package com.controller.stay;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.stay.StayDTO;
import com.exception.MyException;
import com.service.stay.StayService;

@WebServlet("/StayBoardRetrieveServlet")
public class StayBoardRetrieveServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String stayNum = request.getParameter("stayNum");
			StayService service = new StayService();
			String target="stay/stay_retrieveview.jsp";
			try {
				StayDTO dto = service.staySelectByNum(Integer.parseInt(stayNum));
				request.setAttribute("stayRetrieve", dto);
				
				if(request.getAttribute("goodok") != null)
				request.setAttribute("goodok","좋아요 성공~");
				
			} catch (MyException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				target="error.jsp";
			}
			
			RequestDispatcher dis = request.getRequestDispatcher(target);
			dis.forward(request, response);
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
