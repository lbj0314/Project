package com.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dto.notice.NoticeDTO;
import com.dto.notice.PageDTO;
import com.dto.order.PackListDTO;
import com.dto.order.PackOrderDTO;
import com.dto.order.PackResultListDTO;
import com.dto.review.ReviewDTO;
import com.dto.review.ReviewPageDTO;

@Repository("ReviewDAO")
public class ReviewDAO {

	@Autowired
	SqlSessionTemplate template;
	
	
	public void packReviewInsert(ReviewDTO dto) {
		template.insert("packReviewInsert",dto);
	}
	
	
	@Transactional
	public ReviewDTO reviewRetrieve(int packReviewNum) {
		ReviewDTO dto = template.selectOne("reviewRetrieve",packReviewNum); //수정해야함
		template.update("readReviewCnt",packReviewNum);
		return dto;
	}
	
	public PackOrderDTO packOrderView(Map<String, Integer> map) {
		PackOrderDTO dto = template.selectOne("packOrderView",map);
		return dto;
	}
	
	
	public List<PackListDTO> packListSelect(Map<String, Integer> map){
		List<PackListDTO> dto = template.selectList("packListSelect",map);
		return dto;
		
	}
	
	public List<PackResultListDTO> packListView(Map<String, Object> map) {
		List<PackResultListDTO> dto = template.selectList("packListView",map);
		return dto;
	}
	
	@Transactional
	public ReviewDTO readpackReviewGoods(int packReviewNum) {
		template.update("readpackReviewGoods",packReviewNum);
		return template.selectOne("reviewRetrieve",packReviewNum);
	}
	public void packReviewUpdate(ReviewDTO dto) {
		template.update("packReviewUpdate", dto);
	}
	
	
	public void packReviewDelete(int packReviewNum) {
		template.delete("packReviewDelete",packReviewNum);
	}
	
	
	
		//6. 검색보기
		public List<NoticeDTO> search(HashMap<String, String> map){
	      List<NoticeDTO> list =template.selectList("search", map);
		  return list;
		}//end list()	
		
		//7. 페이징 처리
		public ReviewPageDTO page(HashMap<String, String> map ){
			  
			  ReviewPageDTO dto = new ReviewPageDTO();
			  
			  int sIndex = (Integer.parseInt(map.get("curPage")) - 1)* ReviewPageDTO.getPerPage();
		      int length  = ReviewPageDTO.getPerPage();
			
		      List<ReviewDTO> list = template.selectList("reviewselectAll", map ,new RowBounds(sIndex, length));
			  int totalCount=0;
		      //PageDTO에 4개의 데이터 저장
			  System.out.println("!!!"+list);
		      dto.setList(list);
		      dto.setCurPage(Integer.parseInt(map.get("curPage")));
		      System.out.println(">>"+dto.getList());
		      if(map.get("searchValue")==null){
		    	  totalCount = template.selectOne("reviewtotalCount");
		      }else{
		    	  totalCount = template.selectOne("reviewtotalCount1", map);
		      }
		      
		      dto.setTotalCount(totalCount);
		      dto.setSearchName(map.get("searchName"));
		      dto.setSearchValue(map.get("searchValue"));
		      return dto;
		}//end list()
	
	
	
	
	
	
	

}
