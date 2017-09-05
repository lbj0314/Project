package com.service.tour;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.tour.TourDAO;
import com.dto.tour.TourDTO;
import com.exception.MyException;
import com.mybatis.MybatisTemplate;

public class TourService {

	public List<TourDTO> TourList(int attNum) throws MyException {
		SqlSession session = MybatisTemplate.openSession();
		TourDAO dao = new TourDAO();
		List<TourDTO> dto = null;
		try {
			dto = dao.tourList(session, attNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyException("tourList 실패");
		} finally {
			session.close();
		}
		return dto;
	}// end tourList

}