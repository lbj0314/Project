package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.event.EventDTO;
import com.dto.event.EventPageDTO;

@Repository
public class EventDAO {

	@Autowired
	SqlSessionTemplate template;

	
   //2. 글쓰기
	public void boardWrite(EventDTO dto) {
		template.insert("eventBoardWrite", dto);
	}
	//3글 자세히 보기
	public EventDTO selectByNum(int num) {
		EventDTO dto = template.selectOne("eventSelectByNum", num);
		return dto;
	}
	public void readCnt(int num) {
		template.update("eventReadCnt",num);
	}

	//4. 글 삭제
	public void deleteByNum(int num) {
		template.delete("eventDeleteByNum",num);
	}
	//5. 글 수정
		public void updateByNum(EventDTO dto) {
			template.update("eventUpdateByNum", dto);
		}
		
		//6. 검색보기
		public List<EventDTO> search(HashMap<String, String> map){
	      List<EventDTO> list =template.selectList("eventSearch", map);
		  return list;
		}//end list()	
		
		//7. 페이징 처리
		public EventPageDTO page(HashMap<String, String> map ){
			  
			  EventPageDTO dto = new EventPageDTO();
			  
			  int sIndex = (Integer.parseInt(map.get("curPage")) - 1)* EventPageDTO.getEventPerPage();
		      int length  = EventPageDTO.getEventPerPage();
			
		      List<EventDTO> list = template.selectList("eventSelectAll", map ,new RowBounds(sIndex, length));
			  int totalCount=0;
		      //EventPageDTO에 4개의 데이터 저장
			  System.out.println("!!!"+list);
		      dto.setEventList(list);
		      dto.setEventCurPage(Integer.parseInt(map.get("curPage")));
		      System.out.println(">>"+dto.getEventList());
		      if(map.get("searchValue")==null){
		    	  totalCount = template.selectOne("eventTotalCount");
		      }else{
		    	  totalCount = template.selectOne("eventTotalCount1", map);
		      }
		      
		      dto.setEventTotalCount(totalCount);
		      dto.setEventSearchName(map.get("searchName"));
		      dto.setEventSearchValue(map.get("searchValue"));
		      return dto;
		}//end list()
}
