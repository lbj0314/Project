package com.dao.stay;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.stay.StayDTO;
import com.dto.stay.StayPageDTO;

public class StayDAO {

	public List<StayDTO> stayList(SqlSession session) {
		List<StayDTO> list = session.selectList("stayEelectAll");
		return list;
	}

	public int stayBoardWrite(SqlSession session, StayDTO staydto) {
		int n = session.insert("stayBoardWrite", staydto);
		return n;
	}

	public StayDTO staySelectByNum(SqlSession session, int stayNum) {
		StayDTO dto = session.selectOne("staySelectByNum", stayNum);
		return dto;
	}

	public int stayReadCnt(SqlSession session, int stayNum) {
		int n = session.update("stayReadCnt", stayNum);
		return n;
	}

	public int stayDeleteByNum(SqlSession session, int stayNum) {
		int n = session.delete("stayDeleteByNum", stayNum);
		return n;
	}

	public int stayUpdateByNum(SqlSession session, StayDTO staydto) {
		int n = session.update("stayUpdateByNum", staydto);
		return n;
	}

	public List<StayDTO> staySearch(SqlSession session, HashMap<String, String> staymap) {
		List<StayDTO> list = session.selectList("staySearch", staymap);
		return list;
	}

	public StayPageDTO stayPage(SqlSession session, int stayCurPage, HashMap<String, String> staymap) {

		StayPageDTO dto = new StayPageDTO();

		int sIndex = (stayCurPage - 1) * StayPageDTO.getStayPerPage();
		int length = StayPageDTO.getStayPerPage();

		List<StayDTO> list = session.selectList("staySelectAll", staymap, new RowBounds(sIndex, length));
		int stayTotalCount = 0;
		System.out.println("!" + list);
		dto.setStayList(list);
		dto.setStayCurPage(stayCurPage);
		System.out.println(">" + dto.getStayList());
		if (staymap.get("staySearchValue") == null) {
			stayTotalCount = session.selectOne("stayTotalCount");
		} else {
			stayTotalCount = session.selectOne("stayTotalCount1", staymap);
		}

		dto.setStayTotalCount(stayTotalCount);
		dto.setStaySearchName(staymap.get("staySearchName"));
		dto.setStaySearchValue(staymap.get("staySearchValue"));
		return dto;
	}

}// end class
