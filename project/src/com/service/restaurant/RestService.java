package com.service.restaurant;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.dao.restaurant.RestDAO;
import com.dto.restaurant.RestDTO;
import com.dto.restaurant.RestPageDTO;
import com.exception.MyException;
import com.mybatis.MybatisTemplate;

public class RestService {
	public void restWrite(RestDTO dto) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		RestDAO dao = new RestDAO();
		try {
			int n = dao.restWrite(session, dto);
			if (n == 1) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("restWrite 예외발생");
		} finally {
			session.close();
		}

	}// end boardWrite

	public RestDTO restSelectByNum(int restNum) throws MyException {

		SqlSession session = MybatisTemplate.openSession();
		RestDAO dao = new RestDAO();
		RestDTO dto = null;
		try {
			int n = dao.restReadCnt(session, restNum);
			if (n == 1)
				session.commit();
			dto = dao.restSelectByNum(session, restNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("restSelectByNum 예외발생");
		} finally {
			session.close();
		}
		return dto;
	}// end restSelectByNum

	public void restGoods(int restNum) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		RestDAO dao = new RestDAO();
		try {
			int n = dao.restGoods(session, restNum);
			if (n == 1)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("goodsRest 예외발생");
		} finally {
			session.close();

		}
	}

	public void restDeleteByNum(int restNum) throws MyException {

		SqlSession session = MybatisTemplate.openSession();
		RestDAO dao = new RestDAO();
		try {
			int n = dao.restDeleteByNum(session, restNum);
			if (n == 1)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("restDeleteByNum 예외발생");
		} finally {
			session.close();
		}

	}// end restDeleteByNum

	public void restUpdateByNum(RestDTO dto) throws MyException {

		SqlSession session = MybatisTemplate.openSession();
		RestDAO dao = new RestDAO();
		try {
			int n = dao.restUpdateByNum(session, dto);
			if (n == 1)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("restUpdateByNum 예외발생");
		} finally {
			session.close();
		}

	}// end deleteByNum

	public RestPageDTO restPage(int restCurPage, HashMap<String, String> map) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		RestDAO dao = new RestDAO();
		RestPageDTO list = null;
		try {
			list = dao.restPage(session, restCurPage, map);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("restlist 예외발생");
		} finally {
			session.close();
		}
		return list;
	}
}