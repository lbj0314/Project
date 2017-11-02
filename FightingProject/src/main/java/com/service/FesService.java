package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.FesDAO;
import com.dto.fes.FesDTO;

@Service("FesService")
public class FesService {

	@Autowired
	FesDAO dao;
	
	public List<FesDTO> fesAll() {
		List<FesDTO> dto = dao.fesAll();
		return dto;
	}
	
	public List<FesDTO> fesList(String fesSeason) {
		List<FesDTO> dto = dao.fesList(fesSeason);
		return dto;
	}
	
}
