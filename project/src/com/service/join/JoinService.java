package com.service.join;

import org.apache.ibatis.session.SqlSession;

import com.dao.join.JoinDAO;
import com.dto.login.AdmDTO;
import com.dto.login.ComDTO;
import com.dto.login.EntDTO;
import com.exception.MyException;
import com.mybatis.MybatisTemplate;

public class JoinService {
	
	public void comJoin(ComDTO dto) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		JoinDAO dao = new JoinDAO();
		try {
			int n = dao.comJoin(session, dto);
			if(n==1) {
				session.commit();
			}
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("일반회원 가입 예외");
		}finally {
			session.close();
		}
	}
	
	public void admJoin(AdmDTO dto) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		JoinDAO dao = new JoinDAO();
		try {
			int n = dao.admJoin(session, dto);
			if(n==1) {
				session.commit();
			}
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("관리자회원 가입 예외");
		}finally {
			session.close();
		}
	}
	
	public void entJoin(EntDTO dto) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		JoinDAO dao = new JoinDAO();
		try {
			int n = dao.entJoin(session, dto);
			if(n==1) {
				session.commit();
			}
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("기업회원 가입 예외");
		}finally {
			session.close();
		}
	}
}
