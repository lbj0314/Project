package com.dao.restaurant;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.restaurant.RestDTO;
import com.dto.restaurant.RestPageDTO;

public class RestDAO {

	public List<RestDTO> restList(SqlSession session) {
		List<RestDTO> list = session.selectList("restSelectAll");
		return list;
	}

	public int restBoardWrite(SqlSession session, RestDTO restdto) {
		int n = session.insert("restBoardWrite", restdto);
		return n;
	}

	public RestDTO restSelectByNum(SqlSession session, int restNum) {
		RestDTO dto = session.selectOne("restSelectByNum", restNum);
		return dto;
	}

	public int restReadCnt(SqlSession session, int restNum) {
		int n = session.update("restReadCnt", restNum);
		return n;
	}

	public int restDeleteByNum(SqlSession session, int restNum) {
		int n = session.delete("restDeleteByNum", restNum);
		return n;
	}

	public int restUpdateByNum(SqlSession session, RestDTO restdto) {
		int n = session.update("restUpdateByNum", restdto);
		return n;
	}

	public List<RestDTO> restSearch(SqlSession session, HashMap<String, String> restmap) {
		List<RestDTO> list = session.selectList("restSearch", restmap);
		return list;
	}

	public RestPageDTO restPage(SqlSession session, int restCurPage, HashMap<String, String> restmap) {

		RestPageDTO dto = new RestPageDTO();

		int sIndex = (restCurPage - 1) * RestPageDTO.getRestPerPage();
		int length = RestPageDTO.getRestPerPage();

		List<RestDTO> list = session.selectList("restSelectAll", restmap, new RowBounds(sIndex, length));
		int restTotalCount = 0;
		System.out.println("!" + list);
		dto.setRestList(list);
		dto.setRestCurPage(restCurPage);
		System.out.println(">" + dto.getRestList());
		if (restmap.get("searchValue") == null) {
			restTotalCount = session.selectOne("restTotalCount");
		} else {
			restTotalCount = session.selectOne("restTotalCount1", restmap);
		}

		dto.setRestTotalCount(restTotalCount);
		dto.setRestSearchName(restmap.get("restSearchName"));
		dto.setRestSearchValue(restmap.get("restSearchValue"));
		return dto;
	}

	public List<RestDTO> restList(SqlSession session, String restNum) {
		// TODO Auto-generated method stub
		return null;
	}

}// end class
