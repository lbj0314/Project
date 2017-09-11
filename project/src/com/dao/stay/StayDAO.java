package com.dao.stay;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.stay.StayDTO;
import com.dto.stay.StayPageDTO;



public class StayDAO {


   //2. 명소 글쓰기
	public int stayWrite(SqlSession session , StayDTO dto) {
		int n = session.insert("stayWrite", dto);
		return n;
	}
	
	
	//3투어 글 자세히 보기
	public StayDTO staySelectByNum(SqlSession session , int stayNum) {
		StayDTO dto = session.selectOne("staySelectByNum", stayNum);
		return dto;
	}
	public int stayReadCnt(SqlSession session , int stayNum) {
		int n = session.update("stayReadCnt",stayNum);
		return n;
	}

	//4. 글 삭제
	public int stayDeleteByNum(SqlSession session , int stayNum) {
		int n = session.delete("stayDeleteByNum",stayNum);
		return n;
	}
	//5. 글 수정
		public int stayUpdateByNum(SqlSession session , StayDTO dto) {
			int n = session.update("stayUpdateByNum", dto);
			return n;
		}
		//7. 페이징 처리
		public StayPageDTO stayPage(SqlSession session, int stayCurPage , HashMap<String, String> map ){
			  
			  StayPageDTO dto = new StayPageDTO();
			  
			  int sIndex = (stayCurPage - 1)* StayPageDTO.getStayPerPage();
		      int length  = StayPageDTO.getStayPerPage();
			
		      List<StayDTO> list = session.selectList("staySelect", map ,new RowBounds(sIndex, length));
			  int stayTotalCount=0;
		      //PageDTO에 4개의 데이터 저장
			  System.out.println("!!!"+list);
		      dto.setList(list);
		      dto.setStayCurPage(stayCurPage);
		      System.out.println(">>"+dto.getList());
		    
		      stayTotalCount = session.selectOne("stayTotalCount", map);
		     
		      
		      dto.setStayTotalCount(stayTotalCount);
		      dto.setStaySearchName(map.get("staySearchName"));
		      dto.setStaySearchValue(map.get("staySearchValue"));
		      dto.setStayLocation(map.get("stayLocation"));
		      dto.setStayType(map.get("stayType"));
		      dto.setStayGrade(map.get("stayGrade"));
		      dto.setSortStay(map.get("sortstay"));
		      return dto;
		}//end list()
		
		
		/// 좋아요
		public int stayGoods(SqlSession session , int stayNum) {
			int n = session.update("stayGoods",stayNum);
			return n;
		}
}//end class
