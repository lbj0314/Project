package com.dao.restaurant;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.restaurant.RestDTO;
import com.dto.restaurant.RestPageDTO;
import com.dto.tour.TourDTO;
import com.dto.tour.TourPageDTO;



public class RestDAO {


   //2. 명소 글쓰기
	public int restWrite(SqlSession session , RestDTO dto) {
		int n = session.insert("restWrite", dto);
		return n;
	}
	
	
	//3투어 글 자세히 보기
	public RestDTO selectByRestNum(SqlSession session , int num) {
		RestDTO dto = session.selectOne("selectByRestNum", num);
		return dto;
	}
	public int readRestCnt(SqlSession session , int num) {
		int n = session.update("readRestCnt",num);
		return n;
	}

	//4. 글 삭제
	public int deleteByRestNum(SqlSession session , int num) {
		int n = session.delete("deleteByRestNum",num);
		return n;
	}
	//5. 글 수정
		public int updateByRestNum(SqlSession session , RestDTO dto) {
			int n = session.update("updateByRestNum", dto);
			return n;
		}
		
		/*//6. 검색보기
		public List<NoticeDTO> search(SqlSession session, HashMap<String, String> map){
	      List<NoticeDTO> list =session.selectList("search", map);
		  return list;
		}//end list()	
		*/
		//7. 페이징 처리
		public RestPageDTO page(SqlSession session, int curPage , HashMap<String, String> map ){
			  
			  RestPageDTO dto = new RestPageDTO();
			  
			  int sIndex = (curPage - 1)* RestPageDTO.getPerPage();
		      int length  = RestPageDTO.getPerPage();
			
		      List<RestDTO> list = session.selectList("selectRest", map ,new RowBounds(sIndex, length));
			  int totalCount=0;
		      //PageDTO에 4개의 데이터 저장
			  System.out.println("!!!"+list);
		      dto.setList(list);
		      dto.setCurPage(curPage);
		      System.out.println(">>"+dto.getList());
		    
		      totalCount = session.selectOne("ResttotalCount1", map);
		     
		      
		      dto.setTotalCount(totalCount);
		      dto.setSearchName(map.get("searchName"));
		      dto.setSearchValue(map.get("searchValue"));
		      dto.setRestLocation(map.get("restLocation"));
		      dto.setRestType(map.get("restType"));
		      dto.setSortRest(map.get("sortRest"));
		      return dto;
		}//end list()
		
		
		/// 좋아요
		public int goodsRest(SqlSession session , int num) {
			int n = session.update("goodsRest",num);
			return n;
		}
}//end class










