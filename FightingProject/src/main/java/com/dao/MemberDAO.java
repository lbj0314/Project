package com.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.login.AdmDTO;
import com.dto.login.ComDTO;
import com.dto.login.EntDTO;

@Repository
public class MemberDAO {

	@Autowired
	SqlSessionTemplate template;
	
	public ComDTO comLogin(HashMap<String, String> map) {
		return template.selectOne("comLogin", map);
	}
	
	public EntDTO entLogin(HashMap<String, String> map) {
		return template.selectOne("entLogin", map);
	}
	
	public AdmDTO admLogin(HashMap<String, String> map) {
		return template.selectOne("admLogin", map);
	}
	
}
