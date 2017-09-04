package com.service.login;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.dao.login.LoginDAO;
import com.dto.login.AdmDTO;
import com.dto.login.ComDTO;
import com.dto.login.EntDTO;
import com.exception.MyException;
import com.mybatis.MybatisTemplate;

public class LoginService {
	
	public ComDTO comLogin(HashMap<String, String> map) throws MyException{
		SqlSession session = MybatisTemplate.openSession();
		LoginDAO dao = new LoginDAO();
		ComDTO dto = null;
		try {
		dto = dao.comLogin(session, map);
		}catch(Exception e) {
			throw new MyException("일반 회원 로그인 예외");
		}finally {
			session.close();
		}
		return dto;
		
	}
	
	public AdmDTO admLogin(HashMap<String, String> map) throws MyException{
		SqlSession session = MybatisTemplate.openSession();
		LoginDAO dao = new LoginDAO();
		AdmDTO dto = null;
		try {
		dto = dao.admLogin(session, map);
		}catch(Exception e) {
			throw new MyException("관리자 로그인 예외");
		}finally {
			session.close();
		}
		return dto;
		
	}
	
	public EntDTO entLogin(HashMap<String, String> map) throws MyException{
		SqlSession session = MybatisTemplate.openSession();
		LoginDAO dao = new LoginDAO();
		EntDTO dto = null;
		try {
		dto = dao.entLogin(session, map);
		}catch(Exception e) {
			throw new MyException("기업 회원 로그인 예외");
		}finally {
			session.close();
		}
		return dto;
		
	}
}