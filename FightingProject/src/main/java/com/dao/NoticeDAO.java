package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.notice.NoticeDTO;
import com.dto.notice.PageDTO;

@Repository("NoticeDAO")
public class NoticeDAO {
	
	@Autowired
	SqlSessionTemplate template;

	
   //2. 글쓰기
	public void boardWrite(NoticeDTO dto) {
		template.insert("boardWrite", dto);
	}
	//3글 자세히 보기
	public NoticeDTO selectByNum(int num) {
		NoticeDTO dto = template.selectOne("selectByNum", num);
		return dto;
	}
	public void readCnt(int num) {
		template.update("readCnt",num);
	}

	//4. 글 삭제
	public void deleteByNum(int num) {
		template.delete("deleteByNum",num);
	}
	//5. 글 수정
		public void updateByNum(NoticeDTO dto) {
			template.update("updateByNum", dto);
		}
		
		//6. 검색보기
		public List<NoticeDTO> search(HashMap<String, String> map){
	      List<NoticeDTO> list =template.selectList("search", map);
		  return list;
		}//end list()	
		
		//7. 페이징 처리
		public PageDTO page(HashMap<String, String> map ){
			  
			  PageDTO dto = new PageDTO();
			  
			  int sIndex = (Integer.parseInt(map.get("curPage")) - 1)* PageDTO.getPerPage();
		      int length  = PageDTO.getPerPage();
			
		      List<NoticeDTO> list = template.selectList("selectAll", map ,new RowBounds(sIndex, length));
			  int totalCount=0;
		      //PageDTO에 4개의 데이터 저장
			  System.out.println("!!!"+list);
		      dto.setList(list);
		      dto.setCurPage(Integer.parseInt(map.get("curPage")));
		      System.out.println(">>"+dto.getList());
		      if(map.get("searchValue")==null){
		    	  totalCount = template.selectOne("totalCount");
		      }else{
		    	  totalCount = template.selectOne("totalCount1", map);
		      }
		      
		      dto.setTotalCount(totalCount);
		      dto.setSearchName(map.get("searchName"));
		      dto.setSearchValue(map.get("searchValue"));
		      return dto;
		}//end list()

}
