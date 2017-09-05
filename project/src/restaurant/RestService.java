package com.service.restaurant;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.restaurant.RestDAO;
import com.dto.restaurant.RestDTO;
import com.dto.restaurant.RestPageDTO;
import com.exception.MyException;
import com.mybatis.MybatisTemplate;

public class RestService {

	public List<RestDTO> restlist() throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		RestDAO restdao = new RestDAO();
		List<RestDTO> restlist = null;
		try {
			restlist = restdao.restlist(session);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("restlist 예외발생");
		} finally {
			session.close();
		}
		return restlist;
	}

	public void restboardWrite(RestDTO restdto) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		RestDAO restdao = new RestDAO();
		try {
			int n = restdao.restboardWrite(session, restdto);
			if (n == 1) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("restboardWrite 예외발생");
		} finally {
			session.close();
		}

	}

	public RestDTO restselectByNum(int restnum) throws MyException {

		SqlSession session = MybatisTemplate.openSession();
		RestDAO restdao = new RestDAO();
		RestDTO restdto = null;
		try {
			int n = restdao.restreadCnt(session, restnum);
			if (n == 1)
				session.commit();
			restdto = restdao.restselectByNum(session, restnum);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("restselectByNum 예외발생");
		} finally {
			session.close();
		}
		return restdto;
	}

	public void restdeleteByNum(int restnum) throws MyException {

		SqlSession session = MybatisTemplate.openSession();
		RestDAO restdao = new RestDAO();
		try {
			int n = restdao.restdeleteByNum(session, restnum);
			if (n == 1)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("restdeleteByNum 예외발생");
		} finally {
			session.close();
		}

	}

	public void restupdateByNum(RestDTO restdto) throws MyException {

		SqlSession session = MybatisTemplate.openSession();
		RestDAO restdao = new RestDAO();
		try {
			int n = restdao.restupdateByNum(session, restdto);
			if (n == 1)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("restupdateByNum 예외발생");
		} finally {
			session.close();
		}

	}

	public List<RestDTO> restsearch(HashMap<String, String> restmap) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		RestDAO restdao = new RestDAO();
		List<RestDTO> restlist = null;
		try {
			restlist = restdao.restsearch(session, restmap);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("restsearch 예외발생");
		} finally {
			session.close();
		}
		return restlist;
	}

	public RestPageDTO restpage(int restcurPage, HashMap<String, String> restmap) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		RestDAO restdao = new RestDAO();
		RestPageDTO restlist = null;
		try {
			restlist = restdao.restpage(session, restcurPage, restmap);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("restlist 예외발생");
		} finally {
			session.close();
		}
		return restlist;
	}
}