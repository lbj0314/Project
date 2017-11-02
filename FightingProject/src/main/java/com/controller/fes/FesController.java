package com.controller.fes;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.fes.FesDTO;
import com.dto.tour.TourPageDTO;
import com.exception.MyException;
import com.service.FesService;

@Controller
public class FesController {

	@Autowired
	FesService service;
	
	
	@RequestMapping("/fesList")
	@ModelAttribute("fesList")
	public ModelAndView fesList(@RequestParam(value="fesSeason", defaultValue="all") String fesSeason) {
		
		List<FesDTO> festival=service.fesList(fesSeason);
		ModelAndView mav=new ModelAndView();
		mav.addObject("fesList",festival);
		mav.setViewName("fes/fesListView");
		
		return mav;
	}
	
	/*@RequestMapping("/fesRetrieve")
	public String tourRetrieve(int attNum,Model m) throws MyException{
		try {
			m.addAttribute("tourRetrieve",service.selectByTourNum(attNum));
		} catch (Exception e) {
			// TODO Auto-generated catch blocke.
			e.printStackTrace();
				throw new MyException("selectByTour예외");
		}
		return "tour/tourRetrieveView";
		
	}*/
	
	
}
