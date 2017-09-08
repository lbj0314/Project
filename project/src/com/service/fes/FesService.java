package com.service.fes;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.fes.FesDAO;
import com.dto.fes.FesDTO;
import com.exception.MyException;
import com.mybatis.MybatisTemplate;

public class FesService {

	public List<FesDTO> list() throws MyException{
		SqlSession session=MybatisTemplate.openSession();
		FesDAO dao=new FesDAO();
		List<FesDTO> list=null;
		try {
		list=dao.list(session);
		}catch(Exception e) {
			throw new MyException("FesList 불러오기 실패");
		}finally {
			session.close();
		}
		return list;
		
	}//end selectAll
	
}
