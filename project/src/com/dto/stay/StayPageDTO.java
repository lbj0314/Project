package com.dto.stay;

import java.util.List;

public class StayPageDTO {

		private List<StayDTO> staylist;
		private int staycurPage;
		private int staytotalCount; 
		private static int stayperPage = 5;
		private String staysearchName;
		private String staysearchValue;
		private int stayperBlock = 5;
		public StayPageDTO() {
			super();
			// TODO Auto-generated constructor stub
		}
		public StayPageDTO(List<StayDTO> staylist, int staycurPage, int staytotalCount, String staysearchName,
				String staysearchValue, int stayperBlock) {
			super();
			this.staylist = staylist;
			this.staycurPage = staycurPage;
			this.staytotalCount = staytotalCount;
			this.staysearchName = staysearchName;
			this.staysearchValue = staysearchValue;
			this.stayperBlock = stayperBlock;
		}
		public List<StayDTO> getstaylist() {
			return staylist;
		}
		public void setstaylist(List<StayDTO> staylist) {
			this.staylist = staylist;
		}
		public int getstaycurPage() {
			return staycurPage;
		}
		public void setstaycurPage(int staycurPage) {
			this.staycurPage = staycurPage;
		}
		public int getstaytotalCount() {
			return staytotalCount;
		}
		public void setstaytotalCount(int staytotalCount) {
			this.staytotalCount = staytotalCount;
		}
		public static int getstayperPage() {
			return stayperPage;
		}
		public static void setstayperPage(int stayperPage) {
			StayPageDTO.stayperPage = stayperPage;
		}
		public String getstaysearchName() {
			return staysearchName;
		}
		public void setstaysearchName(String staysearchName) {
			this.staysearchName = staysearchName;
		}
		public String getstaysearchValue() {
			return staysearchValue;
		}
		public void setstaysearchValue(String staysearchValue) {
			this.staysearchValue = staysearchValue;
		}
		public int getstayperBlock() {
			return stayperBlock;
		}
		public void setstayperBlock(int stayperBlock) {
			this.stayperBlock = stayperBlock;
		}
		@Override
		public String toString() {
			return "StayPageDTO [staylist=" + staylist + ", staycurPage=" + staycurPage + ", staytotalCount="
					+ staytotalCount + ", staysearchName=" + staysearchName + ", staysearchValue=" + staysearchValue
					+ ", stayperBlock=" + stayperBlock + "]";
		}
		
		

}
