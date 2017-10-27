package com.controller.fes;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.fes.FesDTO;
import com.service.FesService;

@Controller
public class FesController {

	@Autowired
	FesService service;
	
	@RequestMapping("/fesList")
	@ModelAttribute("fesList")
	public List<FesDTO> fesList(@RequestParam String FesSeason){
		return service.fesList(FesSeason);
	}
	
}
