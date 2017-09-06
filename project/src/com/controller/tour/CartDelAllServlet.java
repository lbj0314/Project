/*package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exception.MyException;
import com.service.CartService;

@WebServlet("/CartDelAllServlet")
public class CartDelAllServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] checks = request.getParameterValues("check");
		
		 * ArrayList<Integer> list = null; for (String string : checks) {
		 * list.add(Integer.parseInt(string)); }
		 

		CartService service = new CartService();

		String target = "CartListServlet";

		try {
			if (checks != null) {
				service.delAllCart(Arrays.asList(checks));
				request.setAttribute("delete", "삭제되었습니다.");
			} else {
				request.setAttribute("delete", "삭제할 상품을 체크해 주세요");
			}

		} catch (MyException e) {
			e.printStackTrace();
			target = "error.jsp";
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
*/