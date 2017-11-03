package com.controller.packageOrder;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
		         for (Map<String, Object> map : resultMap) {
		             
		        	 if(map.get("date")==null) map.put("date", 1);
		        	 if(map.get("type").equals("관광지")) {
		        		 TourDTO tourDto = tourService.selectByTourNum(Integer.parseInt((String)map.get("num")));
		        		 map.put("tourDto", tourDto);
		        	 }else if(map.get("type").equals("음식점")) {
		        		 RestDTO restDto = restService.selectByRestNum(Integer.parseInt((String)map.get("num")));
		        		 map.put("restDto", restDto);
		        	 }else  {
		        		 StayDTO stayDto = stayService.staySelectByNum(Integer.parseInt((String)map.get("num")));
		        		 map.put("stayDto", stayDto);
		        	 }
		        	 //System.out.println(map.get("date") + " : " + map.get("num") +" : "+ map.get("type"));
		         }
		         
		         
		         mav.addObject("reserv",resultMap);
		         mav.setViewName("order/packReserv");
		         
		  
		return mav;


	}
	
	
	
	//Ajax 플러스마이너스
	@RequestMapping(value="/packMulty", method=RequestMethod.POST)
	@ResponseBody
	public int packMulty(@RequestParam int n) {
		return n;
	}
	
	
	
	
	@RequestMapping("/packageBuy")
	public void packageBuy(@RequestBody String resultPrice, String startDate,
			HttpSession session,HttpSession session1) {
		//시작날짜,종료날짜,총합계,인원수, 숙박,관광지,맛집별 넘버,몇일차,
		
		
		ComDTO dto =(ComDTO)session.getAttribute("comLogin");
		HashMap<String, String> serviceMap = new HashMap<>();
		serviceMap.put("comId", dto.getComid());
		serviceMap.put("totalPrice", resultPrice);
		serviceMap.put("startDate", startDate);
		
		List<Map<String,Object>> resultMap = (List<Map<String,Object>>)session1.getAttribute("reserv");
		
		String tourList = "";
		String restList = "";
		String stayList = "";
		
		for (Map<String, Object> controllMap : resultMap) {
             
        	 if(controllMap.get("date")==null) controllMap.put("date", 1);
        	 if(controllMap.get("type").equals("관광지")) {
        		 tourList = tourList+","+controllMap.get("num");
        	 }else if(controllMap.get("type").equals("음식점")) {
        		 restList = restList+","+controllMap.get("num");
        	 }else  {
        		 stayList = stayList+","+controllMap.get("num");
        	 }
		}
		serviceMap.put("tourList", tourList);
		serviceMap.put("restList", restList);
		serviceMap.put("stayList", stayList);
		session1.invalidate();
	}
	
	
}
