/*package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.CartDTO;
import com.dto.MemberDTO;
import com.exception.MyException;
import com.service.CartService;
import com.service.MemberService;

@WebServlet("/CartAddServlet")
public class CartAddServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		MemberDTO mem = (MemberDTO) session.getAttribute("login");

		String gImage = request.getParameter("gImage");
		String gName = request.getParameter("gName");
		String gCode = request.getParameter("gCode");
		String gPrice = request.getParameter("gPrice");
		String gSize = request.getParameter("GOODS_SIZE");
		String gColor = request.getParameter("GOODS_COLOR");
		String gAmount = request.getParameter("GOODS_AMOUNT");
				
		String target = "GoodsRetrieveServlet?gCode=" + gCode;
		
		
		
		CartDTO dto = new CartDTO();

		CartService service = new CartService();

		try {
			if (mem != null) {
				if(!gSize.equals("사이즈선택") && !gColor.equals("색상선택")) {
				dto.setUserid(mem.getUserid());
				dto.setgImage(gImage);
				dto.setgName(gName);
				dto.setgPrice(Integer.parseInt(gPrice));
				dto.setgSize(gSize);
				dto.setgCode(gCode);
				dto.setgColor(gColor);
				dto.setgAmount(Integer.parseInt(gAmount));
				service.addCart(dto);
				request.setAttribute("cart", "장바구니에 " + gName + "상품이 잘 담겼습니다.");
				}
				else{
				request.setAttribute("cart", "사이즈와 색상을 선택해 주세요!");
				}
			} else {

				target = "LoginFormServlet";
				request.setAttribute("err", "로그인 후 이용해주세요!");
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