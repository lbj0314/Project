package com.controller.fes;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.fes.FesDTO;
import com.exception.MyException;
import com.service.fes.FesService;

@WebServlet("/FesListServlet")
public class FesListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		FesService service=new FesService();
		String target="FesList.jsp";
		try {
		List<FesDTO> list=service.list();
		request.setAttribute("list",list);
		}catch(MyException e){
			target="error.jsp";
		}
		
		RequestDispatcher dis=request.getRequestDispatcher(target);
		dis.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
