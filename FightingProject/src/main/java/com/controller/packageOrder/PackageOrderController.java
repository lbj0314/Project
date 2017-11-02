package com.controller.packageOrder;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.dto.login.ComDTO;
import com.dto.restaurant.RestDTO;
import com.dto.stay.StayDTO;
import com.dto.tour.TourDTO;
import com.service.RestService;
import com.service.StayService;
import com.service.TourService;

import net.sf.json.JSONArray;

@Controller
public class PackageOrderController {

	@Autowired
	TourService tourService;
	
	@Autowired
	RestService restService;
	
	@Autowired
	StayService stayService;
	
	@RequestMapping("/packageOrderForm")
	@ResponseBody
	public ModelAndView packageOrderForm(@RequestParam(defaultValue="0") int attNum, 
			@RequestParam(defaultValue="0") int restNum, 
			@RequestParam(defaultValue="0") int stayNum,
			@RequestParam(defaultValue="0") int betweenDay,
			@RequestParam(defaultValue="0") String startDay,
			@RequestParam(defaultValue="0") String endDay,
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
		
		session.setAttribute("betweenDay", betweenDay);
		
		if(startDay.equals("0")) {

			Date today = new Date();
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			startDay= transFormat.format(today);
			endDay= transFormat.format(today);
			
			session.setAttribute("startDay", startDay);
			session.setAttribute("endDay", endDay);
		}else if(!startDay.equals("0")) {

			session.setAttribute("startDay", startDay);
			session.setAttribute("endDay", endDay);
		}
		
		
		return mav;
	}
	@RequestMapping(value="/reservationPackage", method=RequestMethod.POST)
	@ResponseBody
	public String reservationPackage(@RequestBody String reservArray,HttpSession session1) {

		
		 List<Map<String,Object>> resultMap = new ArrayList<Map<String,Object>>();
		    resultMap = JSONArray.fromObject(reservArray);
		   
		    
		    session1.setAttribute("reserv", resultMap);
		        
		    
		    
		         
		         
		   return reservArray; 
		        

	}
	
	
	@RequestMapping(value="/packReserv", method=RequestMethod.GET)
	public ModelAndView aaaa(HttpSession session1,HttpSession session) {
		ModelAndView mav = new ModelAndView();
	
		List<Map<String,Object>> resultMap = (List<Map<String,Object>>)session1.getAttribute("reserv");
		
	
		 ComDTO dto =(ComDTO)session.getAttribute("comLogin");
	
		    
		         for (Map<String, Object> map : resultMap) {
		             
		        	 if(map.get("date")==null) map.put("date", 1);
		        	 System.out.println(map.get("date") + " : " + map.get("num") +" : "+ map.get("type") +" : "+ dto.getComid());
		         }
		         
		         
		         mav.addObject("reserv",resultMap);
		         mav.setViewName("order/packReserv");
		         
		  
		return mav;


	}
	
	
}
