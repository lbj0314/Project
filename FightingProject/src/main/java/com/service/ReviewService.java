package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.ReviewDAO;
import com.dto.notice.NoticeDTO;
import com.dto.notice.PageDTO;
import com.dto.order.PackListDTO;
import com.dto.order.PackOrderDTO;
import com.dto.order.PackResultListDTO;
import com.dto.review.ReviewDTO;
import com.dto.review.ReviewPageDTO;

@Service("ReviewService")
public class ReviewService {
	@Autowired
	ReviewDAO dao;
	
	
	public void packReviewInsert(ReviewDTO dto) {
		dao.packReviewInsert(dto);

	}
	public ReviewDTO reviewRetrieve(int packReviewNum) {
		return dao.reviewRetrieve(packReviewNum);
	}
	
	public PackOrderDTO packOrderView(Map<String, Integer> map) {
		
		return dao.packOrderView(map);
		
	}
	
	public List<PackListDTO> packListSelect(Map<String, Integer> map){
		return dao.packListSelect(map);
	}
		
	public List<PackResultListDTO> packListView(Map<String, Object> map) {
		return dao.packListView(map);
	}
	

	public ReviewDTO readpackReviewGoods(int packReviewNum) {
		return dao.readpackReviewGoods(packReviewNum);
	}
	
	
	
	public void packReviewUpdate(ReviewDTO dto) {

		dao.packReviewUpdate(dto);

	}
	
	public void packReviewDelete(int packReviewNum) {

		dao.packReviewDelete(packReviewNum);

	}
	
	
	
	
	/*ublic void boardWrite(NoticeDTO dto) {
		dao.boardWrite(dto);
	}// end boardWrite

	@Transactional
	public NoticeDTO selectByNum(int num) {

		dao.readCnt(num);
			return dao.selectByNum(num);
		
	}// end selectByNum

	// end deleteByNum

	// end deleteByNum

	public List<NoticeDTO> search(HashMap<String, String> map) {
		return dao.search(map);
	}// end list()
*/
	public ReviewPageDTO page(HashMap<String, String> map) {

			return dao.page(map);
	}
	

}
