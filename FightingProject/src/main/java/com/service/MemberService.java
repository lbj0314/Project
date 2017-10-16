package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MemberDAO;
import com.dto.login.AdmDTO;
import com.dto.login.ComDTO;
import com.dto.login.EntDTO;

@Service
public class MemberService {

	@Autowired
	MemberDAO dao;

	public ComDTO comLogin(HashMap<String, String> map) {
		return dao.comLogin(map);
	}

	public EntDTO entLogin(HashMap<String, String> map) {
		return dao.entLogin(map);
	}

	public AdmDTO admLogin(HashMap<String, String> map) {
		return dao.admLogin(map);
	}

}
