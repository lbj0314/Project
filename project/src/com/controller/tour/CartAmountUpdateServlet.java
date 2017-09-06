/*package com.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.MemberDTO;
import com.exception.MyException;
import com.service.CartService;
import com.service.GoodsService;
import com.service.MemberService;

@WebServlet("/CartAmountUpdateServlet")
public class CartAmountUpdateServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String num = request.getParameter("num");
		String amount = request.getParameter("amount");

		CartService service = new CartService();
		HashMap<String, Integer> map = new HashMap<>();
		String target = "CartListServlet";

		try {
			if (Integer.parseInt(amount) > 0) {
				map.put("gAmount", Integer.parseInt(amount));
				map.put("num", Integer.parseInt(num));
				service.amountUpdate(map);
				request.setAttribute("updateamount", "수량이 수정되었습니다.");
			} else {
				request.setAttribute("updateamount", "1이상의 수량을 입력해 주세요!");
			}
		} catch (MyException e) {
			// TODO Auto-generated catch block
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