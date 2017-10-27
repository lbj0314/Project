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
	
	public List<FesDTO> fesList( String FesSeason) {
		return dao.fesList(FesSeason);
	}
	
}
