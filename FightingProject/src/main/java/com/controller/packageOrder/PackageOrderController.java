package com.controller.packageOrder;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.restaurant.RestDTO;
import com.dto.stay.StayDTO;
import com.dto.tour.TourDTO;
import com.service.TourService;

@Controller
public class PackageOrderController {

	@Autowired
	TourService service;
	
	@RequestMapping("/packageOrderForm")
	public ModelAndView packageOrderForm(@RequestParam(defaultValue="0") int attNum, 
			@RequestParam(defaultValue="0") int restNum, 
			@RequestParam(defaultValue="0") int stayNum,
			HttpSession session) {
		
		List<RestDTO> restList = new ArrayList<>();
		session.setAttribute("orderRestList", restList);
		
		List<StayDTO> stayList = new ArrayList<>();
		session.setAttribute("orderStayList", stayList);
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/orderForm");
		if(attNum!=0) {
			if(session.getAttribute("orderTourList")==null) {
				List<TourDTO> tourList = new ArrayList<>();
				TourDTO tourDto = service.selectByTourNum(attNum);
				tourList.add(tourDto);
				session.setAttribute("orderTourList", tourList);
			}else {
			List<TourDTO> tourList = (List<TourDTO>)session.getAttribute("orderTourList");
			TourDTO tourDto = service.selectByTourNum(attNum);
			tourList.add(tourDto);
			session.setAttribute("orderTourList", tourList);
			}
		}else if(restNum!=0) {
			
		}else if(stayNum!=0){
			
		}
		
		
		return mav;
	}
	
	
}
