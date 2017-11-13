package com.dto.review;

import java.util.List;

import org.apache.ibatis.type.Alias;


@Alias("ReviewPageDTO")
public class ReviewPageDTO {
	//전체 데이터
		private List<ReviewDTO> list;
		private int curPage; //현재 페이지
		private int totalCount; //전체 레코드 갯수
		private static int perPage = 5;
		
		private String searchName;
		private String searchValue;
		private int perBlock = 5; // 페이지 당 보여줄 페이지 번호 갯수
		public ReviewPageDTO() {
			super();
			// TODO Auto-generated constructor stub
		}
		public ReviewPageDTO(List<ReviewDTO> list, int curPage, int totalCount, String searchName, String searchValue,
				int perBlock) {
			super();
			this.list = list;
			this.curPage = curPage;
			this.totalCount = totalCount;
			this.searchName = searchName;
			this.searchValue = searchValue;
			this.perBlock = perBlock;
		}
		public List<ReviewDTO> getList() {
			return list;
		}
		public void setList(List<ReviewDTO> list) {
			this.list = list;
		}
		public int getCurPage() {
			return curPage;
		}
		public void setCurPage(int curPage) {
			this.curPage = curPage;
		}
		public int getTotalCount() {
			return totalCount;
		}
		public void setTotalCount(int totalCount) {
			this.totalCount = totalCount;
		}
		public static int getPerPage() {
			return perPage;
		}
		public static void setPerPage(int perPage) {
			ReviewPageDTO.perPage = perPage;
		}
		public String getSearchName() {
			return searchName;
		}
		public void setSearchName(String searchName) {
			this.searchName = searchName;
		}
		public String getSearchValue() {
			return searchValue;
		}
		public void setSearchValue(String searchValue) {
			this.searchValue = searchValue;
		}
		public int getPerBlock() {
			return perBlock;
		}
		public void setPerBlock(int perBlock) {
			this.perBlock = perBlock;
		}
		@Override
		public String toString() {
			return "ReviewPageDTO [list=" + list + ", curPage=" + curPage + ", totalCount=" + totalCount
					+ ", searchName=" + searchName + ", searchValue=" + searchValue + ", perBlock=" + perBlock + "]";
		}
		

		

}
