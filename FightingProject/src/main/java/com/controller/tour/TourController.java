package com.controller.tour;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.tour.TourPageDTO;
import com.exception.MyException;
import com.service.TourService;

@Controller
public class TourController {
	
	@Autowired
	TourService service;
	
	
	
	@RequestMapping("/tourList")
	public String tourList(@RequestParam HashMap<String,String> map,Model m) throws MyException {
		
		
		
		System.out.println(map.get("searchName"));
		System.out.println(map.get("searchValue"));
		System.out.println(map.get("attLocation"));
		System.out.println(map.get("attType"));
		System.out.println(map.get("sortAtt"));
		System.out.println("cc");
		System.out.println("!!!!"+map.get("curPage"));
		if(map.get("curPage") == null) {
			map.put("curPage", "1");
		}
		System.out.println(map.get("curPage"));
		
		try {
			TourPageDTO list=service.page(map);
			m.addAttribute("tourlist",list);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new MyException("tourList예외");
			
		}
		
	
		if(!(map.get("searchValue") == null)) {
			return "tour/tourListView";
			
		}
		
		else if(!(map.get("attLocation") == null) || !(map.get("searchName") == null) ||  !(map.get("attType") == null) || !(map.get("sortAtt") == null)) {
			return "tour/tourAjax";
			
			
			
		}
		
		return "tour/tourListView";
				
	}
	
	
	
	
	@RequestMapping("/tourRetrieve")
	public String tourRetrieve(int attNum,Model m) throws MyException{
		
		try {
			m.addAttribute("tourRetrieve",service.selectByTourNum(attNum));
			/*if(request.getAttribute("goodok") != null)
			request.setAttribute("goodok","좋아요 성공~");
			*/
			
		} catch (Exception e) {
			// TODO Auto-generated catch blocke.
			e.printStackTrace();
		
				throw new MyException("selectByTour예외");
			
		}
		
		
		
		
		return "tour/tourRetrieveView";
		
	}
	
	
	@RequestMapping("/loginX/tourDelete")
	public String tourtourDelete(int attNum) throws MyException{
		
		
		try {
			service.deleteByTourNum(attNum);
		}catch(Exception e) {
			throw new MyException("tourRetrieve 예외");
		}
		return "tour/tourList";
		
	}
	/*
	@RequestMapping(value="/tourUpdate",  method = RequestMethod.POST)
	public 
	*/
	
	
	@RequestMapping("/loginX/tourWriteUI")
	public String tourWriteUI() {
		return "tour/tourwriteview";
	}
	
	
	@RequestMapping("/loginX/tourWrite")
	public String tourWrite() {
		return "tour/tourList";
	}
	
	
	@ExceptionHandler(MyException.class)
	public String xxxx2() {
		return "error";
	}

}
