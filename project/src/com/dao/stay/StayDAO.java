package com.dao.stay;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.stay.StayDTO;
import com.dto.stay.StayPageDTO;

public class StayDAO {

	public List<StayDTO> staylist(SqlSession session) {
		List<StayDTO> list = session.selectList("stayselectAll");
		return list;
	}

	public int stayboardWrite(SqlSession session, StayDTO staydto) {
		int n = session.insert("stayboardWrite", staydto);
		return n;
	}

	public StayDTO stayselectByNum(SqlSession session, int staynum) {
		StayDTO dto = session.selectOne("stayselectByNum", staynum);
		return dto;
	}

	public int stayreadCnt(SqlSession session, int staynum) {
		int n = session.update("stayreadCnt", staynum);
		return n;
	}

	public int staydeleteByNum(SqlSession session, int staynum) {
		int n = session.delete("staydeleteByNum", staynum);
		return n;
	}

	public int stayupdateByNum(SqlSession session, StayDTO staydto) {
		int n = session.update("stayupdateByNum", staydto);
		return n;
	}

	public List<StayDTO> staysearch(SqlSession session, HashMap<String, String> staymap) {
		List<StayDTO> list = session.selectList("staysearch", staymap);
		return list;
	}

	public StayPageDTO staypage(SqlSession session, int staycurPage, HashMap<String, String> staymap) {

		StayPageDTO dto = new StayPageDTO();

		int sIndex = (staycurPage - 1) * StayPageDTO.getstayperPage();
		int length = StayPageDTO.getstayperPage();

		List<StayDTO> list = session.selectList("stayselectAll", staymap, new RowBounds(sIndex, length));
		int staytotalCount = 0;
		System.out.println("!" + list);
		dto.setstaylist(list);
		dto.setstaycurPage(staycurPage);
		System.out.println(">>" + dto.getstaylist());
		if (staymap.get("staysearchValue") == null) {
			staytotalCount = session.selectOne("staytotalCount");
		} else {
			staytotalCount = session.selectOne("staytotalCount2", staymap);
		}

		dto.setstaytotalCount(staytotalCount);
		dto.setstaysearchName(staymap.get("staysearchName"));
		dto.setstaysearchValue(staymap.get("staysearchValue"));
		return dto;
	}

}// end class
