package com.dao.restaurant;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.restaurant.RestDTO;
import com.dto.restaurant.RestPageDTO;

public class RestDAO {

	public List<RestDTO> restlist(SqlSession session) {
		List<RestDTO> list = session.selectList("restselectAll");
		return list;
	}

	public int restboardWrite(SqlSession session, RestDTO restdto) {
		int n = session.insert("restboardWrite", restdto);
		return n;
	}

	public RestDTO restselectByNum(SqlSession session, int restnum) {
		RestDTO dto = session.selectOne("restselectByNum", restnum);
		return dto;
	}

	public int restreadCnt(SqlSession session, int restnum) {
		int n = session.update("restreadCnt", restnum);
		return n;
	}

	public int restdeleteByNum(SqlSession session, int restnum) {
		int n = session.delete("restdeleteByNum", restnum);
		return n;
	}

	public int restupdateByNum(SqlSession session, RestDTO restdto) {
		int n = session.update("restupdateByNum", restdto);
		return n;
	}

	public List<RestDTO> restsearch(SqlSession session, HashMap<String, String> restmap) {
		List<RestDTO> list = session.selectList("restsearch", restmap);
		return list;
	}

	public RestPageDTO restpage(SqlSession session, int restcurPage, HashMap<String, String> restmap) {

		RestPageDTO dto = new RestPageDTO();

		int sIndex = (restcurPage - 1) * RestPageDTO.getRestperPage();
		int length = RestPageDTO.getRestperPage();

		List<RestDTO> list = session.selectList("restselectAll", restmap, new RowBounds(sIndex, length));
		int resttotalCount = 0;
		System.out.println("!" + list);
		dto.setRestlist(list);
		dto.setRestcurPage(restcurPage);
		System.out.println(">>" + dto.getRestlist());
		if (restmap.get("searchValue") == null) {
			resttotalCount = session.selectOne("resttotalCount");
		} else {
			resttotalCount = session.selectOne("resttotalCount2", restmap);
		}

		dto.setResttotalCount(resttotalCount);
		dto.setRestsearchName(restmap.get("restsearchName"));
		dto.setRestsearchValue(restmap.get("restsearchValue"));
		return dto;
	}

}// end class
