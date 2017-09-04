package com.dao.login;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.dto.login.AdmDTO;
import com.dto.login.ComDTO;
import com.dto.login.EntDTO;

public class LoginDAO {
	
	public ComDTO comLogin(SqlSession session, HashMap<String, String> map){
		ComDTO dto = session.selectOne("comLogin", map);
		return dto;
	}
	
	public AdmDTO admLogin(SqlSession session, HashMap<String, String> map){
		AdmDTO dto = session.selectOne("admLogin", map);
		return dto;
	}
	
	public EntDTO entLogin(SqlSession session, HashMap<String, String> map){
		EntDTO dto = session.selectOne("entLogin", map);
		return dto;
	}
}
