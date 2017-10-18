package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.StayDAO;

import com.dto.stay.StayDTO;
import com.dto.stay.StayPageDTO;

@Service("StayService")
public class StayService {
	
	@Autowired
	StayDAO dao;
	

	public void stayWrite(StayDTO dto){
			dao.stayWrite(dto);
	}// end boardWrite

	
	@Transactional
	public StayDTO staySelectByNum(int num) {
			dao.staySelectByNum(num);
			StayDTO dto = dao.staySelectByNum(num);
		return dto;
	}// end selectByNum

	@Transactional
	public StayDTO stayGoods(int num) {
			dao.stayGoods(num);
			return dao.updateGoodsStaySelectByNum(num);
	}

	public void StayDeleteByNum(int num){
			dao.StayDeleteByNum(num);
	}// end deleteByNum

	public void stayUpdateByNum(StayDTO dto) {
			dao.stayUpdateByNum(dto);
	}// end deleteByNum

	
	public StayPageDTO page(HashMap<String, String> map) {
		return dao.page(map);
	}
	
	

}
