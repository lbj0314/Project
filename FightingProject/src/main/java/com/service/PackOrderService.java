package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.PackOrderDAO;
import com.dto.order.PackListDTO;
import com.dto.order.PackOrderDTO;

@Service("PackOrderService")
public class PackOrderService {
	
	@Autowired
	PackOrderDAO dao;
	
	
	public PackOrderDTO packOrderInsert(PackOrderDTO dto,Map<String, Object> map) {
		return dao.packOrderInsert(dto, map);
	}
	
	
	public void packListInsert(List<PackListDTO> dto) {
		dao.packListInsert(dto);
		
	}
	public List<PackOrderDTO> packOrderList(int comNum){
		return dao.packOrderList(comNum);
	}
	
	public List<PackListDTO> packListList(Map<String, Integer> map){
		return dao.packListList(map);
	}

}
