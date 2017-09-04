package com.dao.restaurant;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.restaurant.RestDTO;
import com.dto.restaurant.RestPageDTO;

public class RestDAO {

/*	//1.목록보기
	public List<NoticeDTO> list(SqlSession session){
      List<NoticeDTO> list =session.selectList("selectAll");
	  return list;
	}//end list()
*/	
   //2. 글쓰기
	public int boardWrite(SqlSession session , RestDTO dto) {
		int n = session.insert("boardWrite", dto);
		return n;
	}
	//3글 자세히 보기
	public RestDTO selectByNum(SqlSession session , int num) {
		RestDTO dto = session.selectOne("selectByNum", num);
		return dto;
	}
	public int readCnt(SqlSession session , int num) {
		int n = session.update("readCnt",num);
		return n;
	}

	//4. 글 삭제
	public int deleteByNum(SqlSession session , int num) {
		int n = session.delete("deleteByNum",num);
		return n;
	}
	//5. 글 수정
		public int updateByNum(SqlSession session , RestDTO dto) {
			int n = session.update("updateByNum", dto);
			return n;
		}
		
		//6. 검색보기
		public List<RestDTO> search(SqlSession session, HashMap<String, String> map){
	      List<RestDTO> list =session.selectList("search", map);
		  return list;
		}//end list()	
		
		//7. 페이징 처리
		public RestPageDTO page(SqlSession session, int curPage , HashMap<String, String> map ){
			  
			RestPageDTO dto = new RestPageDTO();
			  
			  int sIndex = (curPage - 1)* RestPageDTO.getRestperPage();
		      int length  = RestPageDTO.getRestperPage();
			
		      List<RestDTO> list = session.selectList("selectAll", map ,new RowBounds(sIndex, length));
			  int totalCount=0;
		      //PageDTO에 4개의 데이터 저장
			  System.out.println("!!!"+list);
		      dto.setRestlist(list);
		      dto.setRestcurPage(curPage);
		      System.out.println(">>"+dto.getRestlist());
		      if(map.get("searchValue")==null){
		    	  totalCount = session.selectOne("totalCount");
		      }else{
		    	  totalCount = session.selectOne("totalCount1", map);
		      }
		      
		      dto.setResttotalCount(totalCount);
		      dto.setRestsearchName(map.get("searchName"));
		      dto.setRestsearchValue(map.get("searchValue"));
		      return dto;
		}//end list()
		
		
}//end class










