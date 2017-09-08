package com.controller.restaurant;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.restaurant.RestDTO;
import com.exception.MyException;
import com.service.restaurant.RestService;

@WebServlet("/RestBoardRetrieveServlet")
public class RestBoardRetrieveServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String restNum = request.getParameter("restNum");
			RestService service = new RestService();
			String target="restaurant/rest_retrieveview.jsp";
			try {
				RestDTO dto = service.restSelectByNum(Integer.parseInt(restNum));
				request.setAttribute("restretrieve", dto);
				
				if(request.getAttribute("goodok") != null)
				request.setAttribute("goodok","좋아요 성공~");
				
			} catch (MyException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				target="error.jsp";
			}
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
