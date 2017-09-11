package com.service.stay;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.dao.stay.StayDAO;
import com.dto.stay.StayDTO;
import com.dto.stay.StayPageDTO;
import com.exception.MyException;
import com.mybatis.MybatisTemplate;

public class StayService {
	public void stayWrite(StayDTO dto) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		StayDAO dao = new StayDAO();
		try {
			int n = dao.stayWrite(session, dto);
			if (n == 1) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("stayWrite 예외발생");
		} finally {
			session.close();
		}

	}// end boardWrite

	public StayDTO staySelectByNum(int stayNum) throws MyException {

		SqlSession session = MybatisTemplate.openSession();
		StayDAO dao = new StayDAO();
		StayDTO dto = null;
		try {
			int n = dao.stayReadCnt(session, stayNum);
			if (n == 1)
				session.commit();
			dto = dao.staySelectByNum(session, stayNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("staySelectByNum 예외발생");
		} finally {
			session.close();
		}
		return dto;
	}// end staySelectByNum

	public void stayGoods(int stayNum) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		StayDAO dao = new StayDAO();
		try {
			int n = dao.stayGoods(session, stayNum);
			if (n == 1)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("goodsStay 예외발생");
		} finally {
			session.close();

		}
	}

	public void stayDeleteByNum(int stayNum) throws MyException {

		SqlSession session = MybatisTemplate.openSession();
		StayDAO dao = new StayDAO();
		try {
			int n = dao.stayDeleteByNum(session, stayNum);
			if (n == 1)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("stayDeleteByNum 예외발생");
		} finally {
			session.close();
		}

	}// end stayDeleteByNum

	public void stayUpdateByNum(StayDTO dto) throws MyException {

		SqlSession session = MybatisTemplate.openSession();
		StayDAO dao = new StayDAO();
		try {
			int n = dao.stayUpdateByNum(session, dto);
			if (n == 1)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("stayUpdateByNum 예외발생");
		} finally {
			session.close();
		}

	}// end deleteByNum

	public StayPageDTO stayPage(int stayCurPage, HashMap<String, String> map) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		StayDAO dao = new StayDAO();
		StayPageDTO list = null;
		try {
			list = dao.stayPage(session, stayCurPage, map);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("staylist 예외발생");
		} finally {
			session.close();
		}
		return list;
	}
}