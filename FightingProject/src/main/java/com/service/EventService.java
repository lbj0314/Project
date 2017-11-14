package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.EventDAO;
import com.dto.event.EventDTO;
import com.dto.event.EventPageDTO;

@Service
public class EventService {


	@Autowired
	EventDAO dao;

	public void boardWrite(EventDTO dto) {
		dao.boardWrite(dto);
	}// end boardWrite

	@Transactional
	public EventDTO selectByNum(int num) {

		dao.readCnt(num);
			return dao.selectByNum(num);
		
	}// end selectByNum

	public void deleteByNum(int num) {

		dao.deleteByNum(num);

	}// end deleteByNum

	public void updateByNum(EventDTO dto) {

		dao.updateByNum(dto);

	}// end deleteByNum

	public List<EventDTO> search(HashMap<String, String> map) {
		return dao.search(map);
	}// end list()

	public EventPageDTO page(HashMap<String, String> map) {

			return dao.page(map);
	}

}
