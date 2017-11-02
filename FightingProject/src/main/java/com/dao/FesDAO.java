package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.fes.FesDTO;

@Repository("FesDAO")
public class FesDAO {

	@Autowired
	SqlSessionTemplate template;

	public List<FesDTO> fesAll() {
		List<FesDTO> dto = template.selectList("fesList");
		return dto;
	}
	
	public List<FesDTO> fesList(String fesSeason) {
		List<FesDTO> dto = template.selectList("fesList", fesSeason);
		return dto;
	}

}
