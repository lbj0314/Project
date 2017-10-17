package com.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.login.AdmDTO;
import com.dto.login.ComDTO;
import com.dto.login.EntDTO;

@Repository
public class JoinDAO {

	@Autowired
	SqlSessionTemplate template;
	
	public void comJoin(ComDTO dto) {
		template.insert("comJoin", dto);
	}

	public void entJoin(EntDTO dto) {
		template.insert("entJoin", dto);
	}
	
	public void admJoin(AdmDTO dto) {
		template.insert("admJoin", dto);
	}
}
