package com.dao.restaurant;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.restaurant.RestDTO;
import com.dto.restaurant.RestPageDTO;

public class RestDAO {

	 public List<RestDTO> restlist(SqlSession session){ List<RestDTO>
	 list =session.selectList("restselectAll"); return list; }

	public int restboardWrite(SqlSession session, RestDTO dto) {
		int n = session.insert("restboardWrite", dto);
		return n;
	}

	public RestDTO restselectByNum(SqlSession session, int num) {
		RestDTO dto = session.selectOne("restselectByNum", num);
		return dto;
	}

	public int restreadCnt(SqlSession session, int num) {
		int n = session.update("restreadCnt", num);
		return n;
	}

	public int restdeleteByNum(SqlSession session, int num) {
		int n = session.delete("restdeleteByNum", num);
		return n;
	}

	public int restupdateByNum(SqlSession session, RestDTO dto) {
		int n = session.update("restupdateByNum", dto);
		return n;
	}

	public List<RestDTO> restsearch(SqlSession session, HashMap<String, String> map) {
		List<RestDTO> list = session.selectList("restsearch", map);
		return list;
	}

	public RestPageDTO restpage(SqlSession session, int restcurPage, HashMap<String, String> map) {

		RestPageDTO dto = new RestPageDTO();

		int sIndex = (restcurPage - 1) * RestPageDTO.getRestperPage();
		int length = RestPageDTO.getRestperPage();

		List<RestDTO> list = session.selectList("restselectAll", map, new RowBounds(sIndex, length));
		int totalCount = 0;
		System.out.println("!" + list);
		dto.setRestlist(list);
		dto.setRestcurPage(restcurPage);
		System.out.println(">>" + dto.getRestlist());
		if (map.get("searchValue") == null) {
			totalCount = session.selectOne("resttotalCount");
		} else {
			totalCount = session.selectOne("resttotalCount2", map);
		}

		dto.setResttotalCount(totalCount);
		dto.setRestsearchName(map.get("restsearchName"));
		dto.setRestsearchValue(map.get("restsearchValue"));
		return dto;
	}

}// end class
