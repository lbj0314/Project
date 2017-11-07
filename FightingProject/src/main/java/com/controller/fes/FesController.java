package com.controller.fes;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dto.fes.FesDTO;
import com.exception.MyException;
import com.service.FesService;

@Controller
public class FesController {
	

	@Autowired
	FesService service;
	
	
	@RequestMapping("/fesList")
	public ModelAndView fesList() {
		
		List<FesDTO> list= new ArrayList<>();
		list = service.fesList();
		
		ModelAndView mav=new ModelAndView();
		System.out.println(list);
		mav.addObject("list",list);
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
