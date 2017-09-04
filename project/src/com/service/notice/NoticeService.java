package com.service.notice;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.notice.NoticeDAO;
import com.dto.notice.NoticeDTO;
import com.dto.notice.PageDTO;
import com.exception.MyException;
import com.mybatis.MybatisTemplate;

public class NoticeService {
	
	

	/*public List<NoticeDTO> list() throws MyException{
		SqlSession session = MybatisTemplate.openSession();
		NoticeDAO dao = new NoticeDAO();
		List<NoticeDTO> list = null;
		try {
			list = dao.list(session);
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("list 예외발생");
		}finally {
			session.close();
		}
		return list;
	}//end list()
	*/
	
	
	public void boardWrite( NoticeDTO dto)throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		NoticeDAO dao = new NoticeDAO();
		try {
			int n = dao.boardWrite(session, dto);
			if(n==1) {
				session.commit();
			}
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("boardWrite 예외발생");
		}finally {
			session.close();
		}
		
	}//end boardWrite
	
	
	public NoticeDTO selectByNum( int num)throws MyException {
		
		SqlSession session = MybatisTemplate.openSession();
		NoticeDAO dao = new NoticeDAO();
		NoticeDTO dto = null;
		try {
			int n = dao.readCnt(session, num);
			if(n==1) session.commit();
			dto = dao.selectByNum(session, num);
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("selectByNum 예외발생");
		}finally {
			session.close();
		}
		return dto;
	}//end selectByNum
	
	public void deleteByNum( int num)throws MyException {
		
		SqlSession session = MybatisTemplate.openSession();
		NoticeDAO dao = new NoticeDAO();
		try {
			int n = dao.deleteByNum(session, num);
			if(n==1) session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("deleteByNum 예외발생");
		}finally {
			session.close();
		}
		
	}//end deleteByNum
	
public void updateByNum( NoticeDTO dto)throws MyException {
		
		SqlSession session = MybatisTemplate.openSession();
		NoticeDAO dao = new NoticeDAO();
		try {
			int n = dao.updateByNum(session, dto);
			if(n==1) session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("updateByNum 예외발생");
		}finally {
			session.close();
		}
		
	}//end deleteByNum

public List<NoticeDTO> search(HashMap<String, String> map) throws MyException{
	SqlSession session = MybatisTemplate.openSession();
	NoticeDAO dao = new NoticeDAO();
	List<NoticeDTO> list = null;
	try {
		list = dao.search(session,map);
	}catch(Exception e) {
		e.printStackTrace();
		throw new MyException("search 예외발생");
	}finally {
		session.close();
	}
	return list;
}//end list()

     public PageDTO page( int curPage, HashMap<String, String> map ) throws MyException{
    	 SqlSession session = MybatisTemplate.openSession();
 		NoticeDAO dao = new NoticeDAO();
 		PageDTO list = null;
 		try {
 			list = dao.page(session, curPage, map);
 		}catch(Exception e) {
 			e.printStackTrace();
 			throw new MyException("list 예외발생");
 		}finally {
 			session.close();
 		}
 		return list;
      }
}











