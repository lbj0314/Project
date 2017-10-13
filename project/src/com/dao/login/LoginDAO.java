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
	
	public int comChange(SqlSession session, ComDTO dto) {
		int n = session.update("comChange", dto);
		return n;
	}
	
	public int comDelete(SqlSession session, int comnum) {
		int n = session.delete("comDelete", comnum);
		return n;
	}
	
	public int entChange(SqlSession session, EntDTO dto) {
		int n = session.update("entChange", dto);
		return n;
	}
	
	public int entDelete(SqlSession session, int entnum) {
		int n = session.delete("entDelete", entnum);
		return n;
	}
}
