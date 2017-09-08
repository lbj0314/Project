package com.dao.restaurant;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.restaurant.RestDTO;
import com.dto.restaurant.RestPageDTO;



public class RestDAO {


   //2. 명소 글쓰기
	public int restWrite(SqlSession session , RestDTO dto) {
		int n = session.insert("restWrite", dto);
		return n;
	}
	
	
	//3투어 글 자세히 보기
	public RestDTO restSelectByNum(SqlSession session , int restNum) {
		RestDTO dto = session.selectOne("restSelectByNum", restNum);
		return dto;
	}
	public int restReadCnt(SqlSession session , int restNum) {
		int n = session.update("restReadCnt",restNum);
		return n;
	}

	//4. 글 삭제
	public int restDeleteByNum(SqlSession session , int restNum) {
		int n = session.delete("restDeleteByNum",restNum);
		return n;
	}
	//5. 글 수정
		public int restUpdateByNum(SqlSession session , RestDTO dto) {
			int n = session.update("restUpdateByNum", dto);
			return n;
		}
		//7. 페이징 처리
		public RestPageDTO restPage(SqlSession session, int restCurPage , HashMap<String, String> map ){
			  
			  RestPageDTO dto = new RestPageDTO();
			  
			  int sIndex = (restCurPage - 1)* RestPageDTO.getRestPerPage();
		      int length  = RestPageDTO.getRestPerPage();
			
		      List<RestDTO> list = session.selectList("restSelect", map ,new RowBounds(sIndex, length));
			  int restTotalCount=0;
		      //PageDTO에 4개의 데이터 저장
			  System.out.println("!!!"+list);
		      dto.setList(list);
		      dto.setRestCurPage(restCurPage);
		      System.out.println(">>"+dto.getList());
		    
		      restTotalCount = session.selectOne("restTotalCount", map);
		     
		      
		      dto.setRestTotalCount(restTotalCount);
		      dto.setRestSearchName(map.get("restSearchName"));
		      dto.setRestSearchValue(map.get("restSearchValue"));
		      dto.setRestLocation(map.get("restLocation"));
		      dto.setRestType(map.get("restType"));
		      dto.setSortRest(map.get("sortRest"));
		      return dto;
		}//end list()
		
		
		/// 좋아요
		public int restGoods(SqlSession session , int restNum) {
			int n = session.update("restGoods",restNum);
			return n;
		}
}//end class
