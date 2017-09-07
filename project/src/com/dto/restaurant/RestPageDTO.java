package com.dto.restaurant;

import java.util.List;

public class RestPageDTO {

		private List<RestDTO> restList;
		private int restCurPage;
		private int restTotalCount; 
		private static int restPerPage = 5;
		private String restSearchName;
		private String restSearchValue;
		private int restPerBlock = 5;
		public RestPageDTO() {
			super();
			// TODO Auto-generated constructor stub
		}
		public RestPageDTO(List<RestDTO> restList, int restCurPage, int restTotalCount, String restSearchName,
				String restSearchValue, int restPerBlock) {
			super();
			this.restList = restList;
			this.restCurPage = restCurPage;
			this.restTotalCount = restTotalCount;
			this.restSearchName = restSearchName;
			this.restSearchValue = restSearchValue;
			this.restPerBlock = restPerBlock;
		}
		public List<RestDTO> getRestList() {
			return restList;
		}
		public void setRestList(List<RestDTO> restList) {
			this.restList = restList;
		}
		public int getRestCurPage() {
			return restCurPage;
		}
		public void setRestCurPage(int restCurPage) {
			this.restCurPage = restCurPage;
		}
		public int getRestTotalCount() {
			return restTotalCount;
		}
		public void setRestTotalCount(int restTotalCount) {
			this.restTotalCount = restTotalCount;
		}
		public static int getRestPerPage() {
			return restPerPage;
		}
		public static void setRestPerPage(int restPerPage) {
			RestPageDTO.restPerPage = restPerPage;
		}
		public String getRestSearchName() {
			return restSearchName;
		}
		public void setRestSearchName(String restSearchName) {
			this.restSearchName = restSearchName;
		}
		public String getRestSearchValue() {
			return restSearchValue;
		}
		public void setRestSearchValue(String restSearchValue) {
			this.restSearchValue = restSearchValue;
		}
		public int getRestPerBlock() {
			return restPerBlock;
		}
		public void setRestPerBlock(int restPerBlock) {
			this.restPerBlock = restPerBlock;
		}
		@Override
		public String toString() {
			return "RestPageDTO [restList=" + restList + ", restCurPage=" + restCurPage + ", restTotalCount="
					+ restTotalCount + ", restSearchName=" + restSearchName + ", restSearchValue=" + restSearchValue
					+ ", restPerBlock=" + restPerBlock + "]";
		}
		
}
