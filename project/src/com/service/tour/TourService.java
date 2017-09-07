package com.service.tour;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.tour.TourDAO;

import com.dto.tour.TourDTO;
import com.dto.tour.TourPageDTO;
import com.exception.MyException;
import com.mybatis.MybatisTemplate;

public class TourService {

	/*
	 * public List<NoticeDTO> list() throws MyException{ SqlSession session =
	 * MybatisTemplate.openSession(); NoticeDAO dao = new NoticeDAO();
	 * List<NoticeDTO> list = null; try { list = dao.list(session); }catch(Exception
	 * e) { e.printStackTrace(); throw new MyException("list 예외발생"); }finally {
	 * session.close(); } return list; }//end list()
	 */

	public void tourWrite(TourDTO dto) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		TourDAO dao = new TourDAO();
		try {
			int n = dao.tourWrite(session, dto);
			if (n == 1) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("tourWrite 예외발생");
		} finally {
			session.close();
		}

	}// end boardWrite

	public TourDTO selectByTourNum(int num) throws MyException {

		SqlSession session = MybatisTemplate.openSession();
		TourDAO dao = new TourDAO();
		TourDTO dto = null;
		try {
			int n = dao.readTourCnt(session, num);
			if (n == 1)
				session.commit();
			dto = dao.selectByTourNum(session, num);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("selectByTourNum 예외발생");
		} finally {
			session.close();
		}
		return dto;
	}// end selectByNum

	public void goodsTour(int num) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		TourDAO dao = new TourDAO();
		try {
			int n = dao.goodsTour(session, num);
			if (n == 1)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("goodsTour 예외발생");
		} finally {
			session.close();

		}
	}

	public void deleteByTourNum(int num) throws MyException {

		SqlSession session = MybatisTemplate.openSession();
		TourDAO dao = new TourDAO();
		try {
			int n = dao.deleteByTourNum(session, num);
			if (n == 1)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("deleteByTourNum 예외발생");
		} finally {
			session.close();
		}

	}// end deleteByNum

	public void updateByTourNum(TourDTO dto) throws MyException {

		SqlSession session = MybatisTemplate.openSession();
		TourDAO dao = new TourDAO();
		try {
			int n = dao.updateByTourNum(session, dto);
			if (n == 1)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("updateByTourNum 예외발생");
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
	public TourPageDTO page(int curPage, HashMap<String, String> map) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		TourDAO dao = new TourDAO();
		TourPageDTO list = null;
		try {
			list = dao.page(session, curPage, map);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("listtour 예외발생");
		} finally {
			session.close();
		}
		return list;
	}
}
