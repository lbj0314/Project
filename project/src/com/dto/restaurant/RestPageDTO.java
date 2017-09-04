package com.dto.restaurant;

import java.util.List;

public class RestPageDTO {
	//전체 데이터
		private List<RestDTO> restlist;
		private int restcurPage; //현재 페이지
		private int resttotalCount; //전체 레코드 갯수
		private static int restperPage = 5;
		private String restsearchName;
		private String restsearchValue;
		private int restperBlock = 5; // 페이지 당 보여줄 페이지 번호 갯수
		public RestPageDTO() {
			super();
			// TODO Auto-generated constructor stub
		}
		public RestPageDTO(List<RestDTO> restlist, int restcurPage, int resttotalCount, String restsearchName,
				String restsearchValue, int restperBlock) {
			super();
			this.restlist = restlist;
			this.restcurPage = restcurPage;
			this.resttotalCount = resttotalCount;
			this.restsearchName = restsearchName;
			this.restsearchValue = restsearchValue;
			this.restperBlock = restperBlock;
		}
		public List<RestDTO> getRestlist() {
			return restlist;
		}
		public void setRestlist(List<RestDTO> restlist) {
			this.restlist = restlist;
		}
		public int getRestcurPage() {
			return restcurPage;
		}
		public void setRestcurPage(int restcurPage) {
			this.restcurPage = restcurPage;
		}
		public int getResttotalCount() {
			return resttotalCount;
		}
		public void setResttotalCount(int resttotalCount) {
			this.resttotalCount = resttotalCount;
		}
		public static int getRestperPage() {
			return restperPage;
		}
		public static void setRestperPage(int restperPage) {
			RestPageDTO.restperPage = restperPage;
		}
		public String getRestsearchName() {
			return restsearchName;
		}
		public void setRestsearchName(String restsearchName) {
			this.restsearchName = restsearchName;
		}
		public String getRestsearchValue() {
			return restsearchValue;
		}
		public void setRestsearchValue(String restsearchValue) {
			this.restsearchValue = restsearchValue;
		}
		public int getRestperBlock() {
			return restperBlock;
		}
		public void setRestperBlock(int restperBlock) {
			this.restperBlock = restperBlock;
		}
		@Override
		public String toString() {
			return "RestPageDTO [restlist=" + restlist + ", restcurPage=" + restcurPage + ", resttotalCount="
					+ resttotalCount + ", restsearchName=" + restsearchName + ", restsearchValue=" + restsearchValue
					+ ", restperBlock=" + restperBlock + "]";
		}
		
		

}
