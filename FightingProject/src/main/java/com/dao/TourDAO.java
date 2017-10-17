package com.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.tour.TourDTO;
import com.dto.tour.TourPageDTO;

@Repository("TourDAO")
public class TourDAO {
	
	
	@Autowired
	SqlSessionTemplate template;

	   //2. 명소 글쓰기
		public void tourWrite(TourDTO dto) {
			template.insert("tourWrite", dto);
			
		}
		
		
		//3투어 글 자세히 보기
		public TourDTO selectByTourNum( int num) {
			TourDTO dto = template.selectOne("selectByTourNum", num);
			return dto;
		}
		public void readTourCnt(int num) {
			template.update("readTourCnt",num);
			
		}

		//4. 글 삭제
		public void deleteByTourNum(int num) {
			template.delete("deleteByTourNum",num);
			
		}
		//5. 글 수정
			public void updateByTourNum(TourDTO dto) {
				template.update("updateByTourNum", dto);
			}
			
			/*//6. 검색보기
			public List<NoticeDTO> search(SqlSession session, HashMap<String, String> map){
		      List<NoticeDTO> list =session.selectList("search", map);
			  return list;
			}//end list()	
			*/
			//7. 페이징 처리
			public TourPageDTO page(Map<String, String> map){
				  
				  TourPageDTO dto = new TourPageDTO();
				  System.out.println("dao!!!"+map.get("curPage"));
				  int sIndex = (Integer.parseInt(map.get("curPage")) - 1)* TourPageDTO.getPerPage();
			      int length  = TourPageDTO.getPerPage();
				
			      List<TourDTO> list = template.selectList("selectTour", map ,new RowBounds(sIndex, length));
				  int totalCount=0;
			      //PageDTO에 4개의 데이터 저장
				  System.out.println("!!!"+list);
			      dto.setList(list);
			      dto.setCurPage(Integer.parseInt(map.get("curPage")));
			      System.out.println(">>"+dto.getList());
			    
			      totalCount = template.selectOne("TourtotalCount1", map);
			     
			      
			      dto.setTotalCount(totalCount);
			      dto.setSearchName(map.get("searchName"));
			      dto.setSearchValue(map.get("searchValue"));
			      dto.setAttLocation(map.get("attLocation"));
			      dto.setAttType(map.get("attType"));
			      dto.setSortAtt(map.get("sortAtt"));
			      return dto;
			}//end list()
			
			
			/// 좋아요
			public void goodsTour(int num) {
				template.update("goodsTour",num);
			
			}
	

}
