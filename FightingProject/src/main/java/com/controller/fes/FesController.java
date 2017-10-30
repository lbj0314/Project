package com.controller.fes;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.service.FesService;

@Controller
public class FesController {

	@Autowired
	FesService service;
	
	@RequestMapping("/fesList")
	public String fesList(){
		
		return "fes/fesListView";
	}
	
}
