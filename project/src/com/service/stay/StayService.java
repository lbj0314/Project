package com.service.stay;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.stay.StayDAO;
import com.dto.stay.StayDTO;
import com.dto.stay.StayPageDTO;
import com.exception.MyException;
import com.mybatis.MybatisTemplate;

public class StayService {

	public void stayBoardWrite(StayDTO staydto) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		StayDAO staydao = new StayDAO();
		try {
			int n = staydao.stayBoardWrite(session, staydto);
			if (n == 1) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("stayBoardWrite 예외발생");
		} finally {
			session.close();
		}

	}

	public StayDTO staySelectByNum(int stayNum) throws MyException {

		SqlSession session = MybatisTemplate.openSession();
		StayDAO staydao = new StayDAO();
		StayDTO staydto = null;
		try {
			int n = staydao.stayReadCnt(session, stayNum);
			if (n == 1)
				session.commit();
			staydto = staydao.staySelectByNum(session, stayNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("staySelectByNum 예외발생");
		} finally {
			session.close();
		}
		return staydto;
	}

	public void stayDeleteByNum(int stayNum) throws MyException {

		SqlSession session = MybatisTemplate.openSession();
		StayDAO staydao = new StayDAO();
		try {
			int n = staydao.stayDeleteByNum(session, stayNum);
			if (n == 1)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("stayDeleteByNum 예외발생");
		} finally {
			session.close();
		}

	}

	public void stayUpdateByNum(StayDTO staydto) throws MyException {

		SqlSession session = MybatisTemplate.openSession();
		StayDAO staydao = new StayDAO();
		try {
			int n = staydao.stayUpdateByNum(session, staydto);
			if (n == 1)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("stayUpdateByNum 예외발생");
		} finally {
			session.close();
		}

	}

	public List<StayDTO> staySearch(HashMap<String, String> staymap) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		StayDAO staydao = new StayDAO();
		List<StayDTO> stayList = null;
		try {
			stayList = staydao.staySearch(session, staymap);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("staySearch 예외발생");
		} finally {
			session.close();
		}
		return stayList;
	}

	public StayPageDTO stayPage(int stayCurPage, HashMap<String, String> staymap) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		StayDAO staydao = new StayDAO();
		StayPageDTO stayList = null;
		try {
			stayList = staydao.stayPage(session, stayCurPage, staymap);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("stayList 예외발생");
		} finally {
			session.close();
		}
		return stayList;
	}
}