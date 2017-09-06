package com.dto.stay;

import java.util.List;

public class StayPageDTO {

		private List<StayDTO> stayList;
		private int stayCurPage;
		private int stayTotalCount; 
		private static int stayPerPage = 5;
		private String staySearchName;
		private String staySearchValue;
		private int stayPerBlock = 5;
		public StayPageDTO() {
			super();
			// TODO Auto-generated constructor stub
		}
		public StayPageDTO(List<StayDTO> stayList, int stayCurPage, int stayTotalCount, String staySearchName,
				String staySearchValue, int stayPerBlock) {
			super();
			this.stayList = stayList;
			this.stayCurPage = stayCurPage;
			this.stayTotalCount = stayTotalCount;
			this.staySearchName = staySearchName;
			this.staySearchValue = staySearchValue;
			this.stayPerBlock = stayPerBlock;
		}
		public List<StayDTO> getStayList() {
			return stayList;
		}
		public void setStayList(List<StayDTO> stayList) {
			this.stayList = stayList;
		}
		public int getStayCurPage() {
			return stayCurPage;
		}
		public void setStayCurPage(int stayCurPage) {
			this.stayCurPage = stayCurPage;
		}
		public int getStayTotalCount() {
			return stayTotalCount;
		}
		public void setStayTotalCount(int stayTotalCount) {
			this.stayTotalCount = stayTotalCount;
		}
		public static int getStayPerPage() {
			return stayPerPage;
		}
		public static void setStayPerPage(int stayPerPage) {
			StayPageDTO.stayPerPage = stayPerPage;
		}
		public String getStaySearchName() {
			return staySearchName;
		}
		public void setStaySearchName(String staySearchName) {
			this.staySearchName = staySearchName;
		}
		public String getStaySearchValue() {
			return staySearchValue;
		}
		public void setStaySearchValue(String staySearchValue) {
			this.staySearchValue = staySearchValue;
		}
		public int getStayPerBlock() {
			return stayPerBlock;
		}
		public void setStayPerBlock(int stayPerBlock) {
			this.stayPerBlock = stayPerBlock;
		}
		@Override
		public String toString() {
			return "StayPageDTO [stayList=" + stayList + ", stayCurPage=" + stayCurPage + ", stayTotalCount="
					+ stayTotalCount + ", staySearchName=" + staySearchName + ", staySearchValue=" + staySearchValue
					+ ", stayPerBlock=" + stayPerBlock + "]";
		}
	
}
