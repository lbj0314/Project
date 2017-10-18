package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.RestDAO;
import com.dto.restaurant.RestDTO;
import com.dto.restaurant.RestPageDTO;


@Service("RestService")
public class RestService {
	
	@Autowired
	RestDAO dao;
	

	public void restWrite(RestDTO dto){
			dao.restWrite(dto);
	}// end boardWrite

	
	@Transactional
	public RestDTO selectByRestNum(int num) {
			dao.readRestCnt(num);
			RestDTO dto = dao.selectByRestNum(num);
		return dto;
	}// end selectByNum

	@Transactional
	public RestDTO goodsRest(int num) {
			dao.goodsRest(num);
			return dao.updateGoodsByRestNum(num);
	}

	public void deleteByRestNum(int num){
			dao.deleteByRestNum(num);
	}// end deleteByNum

	public void updateByRestNum(RestDTO dto) {
			dao.updateByRestNum(dto);
	}// end deleteByNum

	
	public RestPageDTO page(HashMap<String, String> map) {
		return dao.page(map);
	}
	
	public RestDTO selectByRestNumTwo(int num) {
			return dao.selectByRestNum(num);
	}
	

}
