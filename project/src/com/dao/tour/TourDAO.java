package com.dao.tour;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.tour.TourDTO;

public class TourDAO {

	public List<TourDTO> tourList(SqlSession session, int attNum) {
		List<TourDTO> dto = session.selectList("tourList", attNum);
		return dto;
	}
}