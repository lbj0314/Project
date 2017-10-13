package com.service.restaurant;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.restaurant.RestDAO;
import com.dao.tour.TourDAO;
import com.dto.restaurant.RestDTO;
import com.dto.restaurant.RestPageDTO;
import com.dto.tour.TourDTO;
import com.dto.tour.TourPageDTO;
import com.exception.MyException;
import com.mybatis.MybatisTemplate;

public class RestService {

	/*
	 * public List<NoticeDTO> list() throws MyException{ SqlSession session =
	 * MybatisTemplate.openSession(); NoticeDAO dao = new NoticeDAO();
	 * List<NoticeDTO> list = null; try { list = dao.list(session); }catch(Exception
	 * e) { e.printStackTrace(); throw new MyException("list 예외발생"); }finally {
	 * session.close(); } return list; }//end list()
	 */

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

	public RestDTO selectByRestNum(int num) throws MyException {

		SqlSession session = MybatisTemplate.openSession();
		RestDAO dao = new RestDAO();
		RestDTO dto = null;
		try {
			int n = dao.readRestCnt(session, num);
			if (n == 1)
				session.commit();
			dto = dao.selectByRestNum(session, num);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("selectByRestNum 예외발생");
		} finally {
			session.close();
		}
		return dto;
	}// end selectByNum

	public void goodsRest(int num) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		RestDAO dao = new RestDAO();
		try {
			int n = dao.goodsRest(session, num);
			if (n == 1)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("goodsRest 예외발생");
		} finally {
			session.close();

		}
	}

	public void deleteByRestNum(int num) throws MyException {

		SqlSession session = MybatisTemplate.openSession();
		RestDAO dao = new RestDAO();
		try {
			int n = dao.deleteByRestNum(session, num);
			if (n == 1)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("deleteByRestNum 예외발생");
		} finally {
			session.close();
		}

	}// end deleteByNum

	public void updateByRestNum(RestDTO dto) throws MyException {

		SqlSession session = MybatisTemplate.openSession();
		RestDAO dao = new RestDAO();
		try {
			int n = dao.updateByRestNum(session, dto);
			if (n == 1)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("updateByRestNum 예외발생");
		} finally {
			session.close();
		}

	}// end deleteByNum

	/*
	 * public List<TourDTO> search(HashMap<String, String> map) throws MyException{
	 * SqlSession session = MybatisTemplate.openSession(); TourDAO dao = new
	 * TourDAO(); List<NoticeDTO> list = null; try { list = dao.search(session,map);
	 * }catch(Exception e) { e.printStackTrace(); throw new
	 * MyException("search 예외발생"); }finally { session.close(); } return list; }//end
	 * list()
	 */
	public RestPageDTO page(int curPage, HashMap<String, String> map) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		RestDAO dao = new RestDAO();
		RestPageDTO list = null;
		try {
			list = dao.page(session, curPage, map);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("listrest 예외발생");
		} finally {
			session.close();
		}
		return list;
	}
	
	public RestDTO selectByRestNumTwo(int num) throws MyException {

		SqlSession session = MybatisTemplate.openSession();
		RestDAO dao = new RestDAO();
		RestDTO dto = null;
		try {
			dto = dao.selectByRestNum(session, num);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("selectByRestNum 예외발생");
		} finally {
			session.close();
		}
		return dto;
	}
}
