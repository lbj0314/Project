package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.TourDAO;
import com.dto.tour.TourDTO;
import com.dto.tour.TourPageDTO;
import com.exception.MyException;


@Service("TourService")
public class TourService {
	
	@Autowired
	TourDAO dao;
	

	public void tourWrite(TourDTO dto){
			dao.tourWrite(dto);
	}// end boardWrite

	
	@Transactional
	public TourDTO selectByTourNum(int num) {
			dao.readTourCnt(num);
			TourDTO dto = dao.selectByTourNum(num);
		return dto;
	}// end selectByNum

	public void goodsTour(int num) {
			dao.goodsTour(num);

	}

	public void deleteByTourNum(int num){
			dao.deleteByTourNum(num);
	}// end deleteByNum

	public void updateByTourNum(TourDTO dto) {
			dao.updateByTourNum(dto);
	}// end deleteByNum

	
	public TourPageDTO page(HashMap<String, String> map) {
		return dao.page(map);
	}
	
	public TourDTO selectByTourNumTwo(int num) {
			return dao.selectByTourNum(num);
	}

}
