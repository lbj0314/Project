package com.dao.join;

import org.apache.ibatis.session.SqlSession;

import com.dto.login.AdmDTO;
import com.dto.login.ComDTO;
import com.dto.login.EntDTO;

public class JoinDAO {
	
	public int comJoin(SqlSession session, ComDTO dto) {
		int n = session.insert("ComJoin", dto);
		return n;
	}
	
	public int admJoin(SqlSession session, AdmDTO dto) {
		int n = session.insert("AdmJoin", dto);
		return n;
	}
	
	public int entJoin(SqlSession session, EntDTO dto) {
		int n = session.insert("EntJoin", dto);
		return n;
	}
}
