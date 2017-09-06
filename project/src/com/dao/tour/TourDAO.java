package com.dao.tour;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.tour.TourDTO;
import com.dto.tour.TourPageDTO;



public class TourDAO {


   //2. 명소 글쓰기
	public int tourWrite(SqlSession session , TourDTO dto) {
		int n = session.insert("tourWrite", dto);
		return n;
	}
	
	
	//3투어 글 자세히 보기
	public TourDTO selectByTourNum(SqlSession session , int num) {
		TourDTO dto = session.selectOne("selectByTourNum", num);
		return dto;
	}
	public int readTourCnt(SqlSession session , int num) {
		int n = session.update("readTourCnt",num);
		return n;
	}

	//4. 글 삭제
	public int deleteByTourNum(SqlSession session , int num) {
		int n = session.delete("deleteByTourNum",num);
		return n;
	}
	//5. 글 수정
		public int updateByTourNum(SqlSession session , TourDTO dto) {
			int n = session.update("updateByTourNum", dto);
			return n;
		}
		
		/*//6. 검색보기
		public List<NoticeDTO> search(SqlSession session, HashMap<String, String> map){
	      List<NoticeDTO> list =session.selectList("search", map);
		  return list;
		}//end list()	
		*/
		//7. 페이징 처리
		public TourPageDTO page(SqlSession session, int curPage , HashMap<String, String> map ){
			  
			  TourPageDTO dto = new TourPageDTO();
			  
			  int sIndex = (curPage - 1)* TourPageDTO.getPerPage();
		      int length  = TourPageDTO.getPerPage();
			
		      List<TourDTO> list = session.selectList("selectTour", map ,new RowBounds(sIndex, length));
			  int totalCount=0;
		      //PageDTO에 4개의 데이터 저장
			  System.out.println("!!!"+list);
		      dto.setList(list);
		      dto.setCurPage(curPage);
		      System.out.println(">>"+dto.getList());
		      if(map.get("searchValue")==null){
		    	  totalCount = session.selectOne("TourtotalCount");
		      }else{
		    	  totalCount = session.selectOne("TourtotalCount1", map);
		      }
		      
		      dto.setTotalCount(totalCount);
		      dto.setSearchName(map.get("searchName"));
		      dto.setSearchValue(map.get("searchValue"));
		      return dto;
		}//end list()
		
		
}//end class










