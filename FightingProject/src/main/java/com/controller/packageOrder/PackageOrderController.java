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
import com.service.RestService;
import com.service.StayService;
import com.service.TourService;

@Controller
public class PackageOrderController {

	@Autowired
	TourService tourService;
	
	@Autowired
	RestService restService;
	
	@Autowired
	StayService stayService;
	
	@RequestMapping("/packageOrderForm")
	public ModelAndView packageOrderForm(@RequestParam(defaultValue="0") int attNum, 
			@RequestParam(defaultValue="0") int restNum, 
			@RequestParam(defaultValue="0") int stayNum,
			HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/orderForm");
		if(attNum!=0) {
			if(session.getAttribute("orderTourList")==null) {
				List<TourDTO> tourList = new ArrayList<>();
				TourDTO tourDto = tourService.selectByTourNum(attNum);
				tourList.add(tourDto);
				session.setAttribute("orderTourList", tourList);
			}else {
			List<TourDTO> tourList = (List<TourDTO>)session.getAttribute("orderTourList");
			TourDTO tourDto = tourService.selectByTourNum(attNum);
			tourList.add(tourDto);
			session.setAttribute("orderTourList", tourList);
			}
		}else if(restNum!=0) {
			if(session.getAttribute("orderRestList")==null) {
				List<RestDTO> restList = new ArrayList<>();
				RestDTO restDto = restService.selectByRestNum(restNum);
				restList.add(restDto);
				session.setAttribute("orderRestList", restList);
			}else {
			List<RestDTO> restList = (List<RestDTO>)session.getAttribute("orderRestList");
			RestDTO restDto = restService.selectByRestNum(restNum);
			restList.add(restDto);
			session.setAttribute("orderRestList", restList);
			}
		}else if(stayNum!=0){
			if(session.getAttribute("orderStayList")==null) {
				List<StayDTO> stayList = new ArrayList<>();
				StayDTO stayDto = stayService.staySelectByNum(stayNum);
				stayList.add(stayDto);
				session.setAttribute("orderStayList", stayList);
			}else {
			List<StayDTO> stayList = (List<StayDTO>)session.getAttribute("orderStayList");
			StayDTO stayDto = stayService.staySelectByNum(stayNum);
			stayList.add(stayDto);
			session.setAttribute("orderStayList", stayList);
			}
		}
		
		
		return mav;
	}
	
	
}
