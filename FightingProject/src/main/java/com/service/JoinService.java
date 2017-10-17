package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.JoinDAO;
import com.dto.login.AdmDTO;
import com.dto.login.ComDTO;
import com.dto.login.EntDTO;

@Service
public class JoinService {

	@Autowired
	JoinDAO dao;
	
	public void comJoin(ComDTO dto) {
		dao.comJoin(dto);
	}
	
	public void entJoin(EntDTO dto) {
		dao.entJoin(dto);
	}
	
	public void admJoin(AdmDTO dto) {
		dao.admJoin(dto);
	}
	
}
