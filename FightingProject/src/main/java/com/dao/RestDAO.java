package com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.restaurant.RestDTO;
import com.dto.restaurant.RestPageDTO;



@Repository("RestDAO")
public class RestDAO {
	
	@Autowired
	SqlSessionTemplate template;

	   //2. 명소 글쓰기
		public void restWrite(RestDTO dto) {
			template.insert("restWrite", dto);
			
		}
		
		
		//3투어 글 자세히 보기
		public RestDTO selectByRestNum( int num) {
			RestDTO dto = template.selectOne("selectByRestNum", num);
			return dto;
		}
		public void readRestCnt(int num) {
			template.update("readRestCnt",num);
			
		}

		//4. 글 삭제
		public void deleteByRestNum(int num) {
			template.delete("deleteByRestNum",num);
			
		}
		//5. 글 수정
			public void updateByRestNum(RestDTO dto) {
				template.update("updateByRestNum", dto);
			}
			
			/*//6. 검색보기
			public List<NoticeDTO> search(SqlSession session, HashMap<String, String> map){
		      List<NoticeDTO> list =session.selectList("search", map);
			  return list;
			}//end list()	
			*/
			//7. 페이징 처리
			public RestPageDTO page(Map<String, String> map){
				  
				  RestPageDTO dto = new RestPageDTO();
				  System.out.println("dao!!!"+map.get("curPage"));
				  int sIndex = (Integer.parseInt(map.get("curPage")) - 1)* RestPageDTO.getPerPage();
			      int length  = RestPageDTO.getPerPage();
				
			      List<RestDTO> list = template.selectList("selectRest", map ,new RowBounds(sIndex, length));
				  int totalCount=0;
			      //PageDTO에 4개의 데이터 저장
				  System.out.println("!!!"+list);
			      dto.setList(list);
			      dto.setCurPage(Integer.parseInt(map.get("curPage")));
			      System.out.println(">>"+dto.getList());
			    
			      totalCount = template.selectOne("ResttotalCount1", map);
			     
			      
			      dto.setTotalCount(totalCount);
			      dto.setSearchName(map.get("searchName"));
			      dto.setSearchValue(map.get("searchValue"));
			      dto.setRestLocation(map.get("restLocation"));
			      dto.setRestType(map.get("restType"));
			      dto.setSortRest(map.get("sortRest"));
			      return dto;
			}//end list()
			
			
			/// 좋아요
			public void goodsRest(int num) {
				template.update("goodsRest",num);
		
			}
			
			public RestDTO updateGoodsByRestNum(int num) {
				RestDTO dto = template.selectOne("updateGoodsByRestNum",num);
				return dto;
			}

}
