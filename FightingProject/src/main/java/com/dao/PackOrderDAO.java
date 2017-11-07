package com.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dto.order.PackListDTO;
import com.dto.order.PackOrderDTO;
import com.dto.restaurant.RestDTO;

@Repository("PackOrderDAO")
public class PackOrderDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	
	//1. 패키지 등록하기
			@Transactional
			public PackOrderDTO packOrderInsert(PackOrderDTO dto,Map<String, Object> map) {
				template.insert("packOrderInsert", dto);
				PackOrderDTO pdto = template.selectOne("selectByPNum", map);
				return pdto;
			}
			
			
			public void packListInsert(List<PackListDTO> dto) {
				template.insert("packListInsert",dto);
				
			}
	

}
