package com.dao.fes;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.fes.FesDTO;

public class FesDAO {

	public List<FesDTO> list(SqlSession session){
		List<FesDTO> list=session.selectList("FesSelectAll");
		return list;
	}
	
	
	
}// end class
