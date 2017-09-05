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

	public void stayboardWrite(StayDTO staydto) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		StayDAO staydao = new StayDAO();
		try {
			int n = staydao.stayboardWrite(session, staydto);
			if (n == 1) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("stayboardWrite 예외발생");
		} finally {
			session.close();
		}

	}

	public StayDTO stayselectByNum(int staynum) throws MyException {

		SqlSession session = MybatisTemplate.openSession();
		StayDAO staydao = new StayDAO();
		StayDTO staydto = null;
		try {
			int n = staydao.stayreadCnt(session, staynum);
			if (n == 1)
				session.commit();
			staydto = staydao.stayselectByNum(session, staynum);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("stayselectByNum 예외발생");
		} finally {
			session.close();
		}
		return staydto;
	}

	public void staydeleteByNum(int staynum) throws MyException {

		SqlSession session = MybatisTemplate.openSession();
		StayDAO staydao = new StayDAO();
		try {
			int n = staydao.staydeleteByNum(session, staynum);
			if (n == 1)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("staydeleteByNum 예외발생");
		} finally {
			session.close();
		}

	}

	public void stayupdateByNum(StayDTO staydto) throws MyException {

		SqlSession session = MybatisTemplate.openSession();
		StayDAO staydao = new StayDAO();
		try {
			int n = staydao.stayupdateByNum(session, staydto);
			if (n == 1)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("stayupdateByNum 예외발생");
		} finally {
			session.close();
		}

	}

	public List<StayDTO> staysearch(HashMap<String, String> staymap) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		StayDAO staydao = new StayDAO();
		List<StayDTO> staylist = null;
		try {
			staylist = staydao.staysearch(session, staymap);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("staysearch 예외발생");
		} finally {
			session.close();
		}
		return staylist;
	}

	public StayPageDTO staypage(int staycurPage, HashMap<String, String> staymap) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		StayDAO staydao = new StayDAO();
		StayPageDTO staylist = null;
		try {
			staylist = staydao.staypage(session, staycurPage, staymap);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("staylist 예외발생");
		} finally {
			session.close();
		}
		return staylist;
	}
}