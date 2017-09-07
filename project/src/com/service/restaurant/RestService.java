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

	public void restBoardWrite(RestDTO restdto) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		RestDAO restdao = new RestDAO();
		try {
			int n = restdao.restBoardWrite(session, restdto);
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

	public RestDTO restSelectByNum(int restNum) throws MyException {

		SqlSession session = MybatisTemplate.openSession();
		RestDAO restdao = new RestDAO();
		RestDTO restdto = null;
		try {
			int n = restdao.restReadCnt(session, restNum);
			if (n == 1)
				session.commit();
			restdto = restdao.restSelectByNum(session, restNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("restSelectByNum 예외발생");
		} finally {
			session.close();
		}
		return restdto;
	}

	public void restDeleteByNum(int restNum) throws MyException {

		SqlSession session = MybatisTemplate.openSession();
		RestDAO restdao = new RestDAO();
		try {
			int n = restdao.restDeleteByNum(session, restNum);
			if (n == 1)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("restDeleteByNum 예외발생");
		} finally {
			session.close();
		}

	}

	public void restUpdateByNum(RestDTO restdto) throws MyException {

		SqlSession session = MybatisTemplate.openSession();
		RestDAO restdao = new RestDAO();
		try {
			int n = restdao.restUpdateByNum(session, restdto);
			if (n == 1)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("restUpdateByNum 예외발생");
		} finally {
			session.close();
		}

	}

	public List<RestDTO> restSearch(HashMap<String, String> restmap) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		RestDAO restdao = new RestDAO();
		List<RestDTO> restList = null;
		try {
			restList = restdao.restSearch(session, restmap);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("restSearch 예외발생");
		} finally {
			session.close();
		}
		return restList;
	}

	public RestPageDTO restPage(int restCurPage, HashMap<String, String> restmap) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		RestDAO restdao = new RestDAO();
		RestPageDTO restList = null;
		try {
			restList = restdao.restPage(session, restCurPage, restmap);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("restList 예외발생");
		} finally {
			session.close();
		}
		return restList;
	}
	public List<RestDTO> restList(String restNum) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		RestDAO dao = new RestDAO();
		List<RestDTO> dto = null;
		try {
			dto = dao.restList(session, restNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("goodsList 실패");
		} finally {
			session.close();
		}
		return dto;
	}// end goodsList

	public List<RestDTO> restRetrieve(String restNum) throws MyException {
		RestDAO dao = new RestDAO();
		List<RestDTO> dto = null;
		SqlSession session = MybatisTemplate.openSession();
		try {
			dto = dao.restRetrieve(session, restNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("상품 자세히 보기 실패");
		} finally {
			session.close();
		}
		return dto;
	}// end list()
}