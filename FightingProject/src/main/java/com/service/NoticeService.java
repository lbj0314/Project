package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.NoticeDAO;
import com.dto.notice.NoticeDTO;
import com.dto.notice.PageDTO;

@Service("NoticeService")
public class NoticeService {

	@Autowired
	NoticeDAO dao;

	public void boardWrite(NoticeDTO dto) {
		dao.boardWrite(dto);
	}// end boardWrite

	@Transactional
	public NoticeDTO selectByNum(int num) {

		dao.readCnt(num);
			return dao.selectByNum(num);
		
	}// end selectByNum

	public void deleteByNum(int num) {

		dao.deleteByNum(num);

	}// end deleteByNum

	public void updateByNum(NoticeDTO dto) {

		dao.updateByNum(dto);

	}// end deleteByNum

	public List<NoticeDTO> search(HashMap<String, String> map) {
		return dao.search(map);
	}// end list()

	public PageDTO page(HashMap<String, String> map) {

			return dao.page(map);
	}

}
