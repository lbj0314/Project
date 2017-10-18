package com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.stay.StayDTO;
import com.dto.stay.StayPageDTO;

@Repository("StayDAO")
public class StayDAO {
	@Autowired
	SqlSessionTemplate template;

	   //2. 명소 글쓰기
		public void stayWrite(StayDTO dto) {
			template.insert("stayWrite", dto);
			
		}
		
		
		//3투어 글 자세히 보기
		public StayDTO staySelectByNum( int num) {
			StayDTO dto = template.selectOne("staySelectByNum", num);
			return dto;
		}
		public void stayReadCnt(int num) {
			template.update("stayReadCnt",num);
			
		}

		//4. 글 삭제
		public void StayDeleteByNum(int num) {
			template.delete("StayDeleteByNum",num);
			
		}
		//5. 글 수정
			public void stayUpdateByNum(StayDTO dto) {
				template.update("stayUpdateByNum", dto);
			}
			
			/*//6. 검색보기
			public List<NoticeDTO> search(SqlSession session, HashMap<String, String> map){
		      List<NoticeDTO> list =session.selectList("search", map);
			  return list;
			}//end list()	
			*/
			//7. 페이징 처리
			public StayPageDTO page(Map<String, String> map){
				  
				  StayPageDTO dto = new StayPageDTO();
				  System.out.println("dao!!!"+map.get("curPage"));
				  int sIndex = (Integer.parseInt(map.get("curPage")) - 1)* StayPageDTO.getStayPerPage();
			      int length  = StayPageDTO.getStayPerPage();
				
			      List<StayDTO> list = template.selectList("staySelect", map ,new RowBounds(sIndex, length));
				  int totalCount=0;
			      //PageDTO에 4개의 데이터 저장
				  System.out.println("!!!"+list);
			      dto.setList(list);
			      dto.setStayCurPage(Integer.parseInt(map.get("curPage")));
			      System.out.println(">>"+dto.getList());
			    
			      totalCount = template.selectOne("stayTotalCount", map);
			     
			      
			      dto.setStayTotalCount(totalCount);
			      dto.setStaySearchName(map.get("searchName"));
			      dto.setStaySearchValue(map.get("searchValue"));
			      dto.setStayLocation(map.get("attLocation"));
			      dto.setStayType(map.get("attType"));
			      dto.setSortStay(map.get("sortAtt"));
			      return dto;
			}//end list()
			
			
			/// 좋아요
			public void stayGoods(int num) {
				template.update("stayGoods",num);
		
			}
			
			public StayDTO updateGoodsStaySelectByNum(int num) {
				StayDTO dto = template.selectOne("updateGoodsStaySelectByNum",num);
				return dto;
			}
			
	

}
