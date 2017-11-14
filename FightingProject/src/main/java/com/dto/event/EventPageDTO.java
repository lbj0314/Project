package com.dto.event;

import java.util.List;

import org.apache.ibatis.type.Alias;

import com.dto.notice.NoticeDTO;
import com.dto.notice.PageDTO;

@Alias("EventPageDTO")
public class EventPageDTO {

	//전체 데이터
			private List<EventDTO> eventList;
			private int eventCurPage; //현재 페이지
			private int eventTotalCount; //전체 레코드 갯수
			private static int eventPerPage = 5;
			
			private String eventSearchName;
			private String eventSearchValue;
			private int eventPerBlock = 5; // 페이지 당 보여줄 페이지 번호 갯수
			public EventPageDTO() {
				super();
				// TODO Auto-generated constructor stub
			}
			public EventPageDTO(List<EventDTO> eventList, int eventCurPage, int eventTotalCount, String eventSearchName,
					String eventSearchValue, int eventPerBlock) {
				super();
				this.eventList = eventList;
				this.eventCurPage = eventCurPage;
				this.eventTotalCount = eventTotalCount;
				this.eventSearchName = eventSearchName;
				this.eventSearchValue = eventSearchValue;
				this.eventPerBlock = eventPerBlock;
			}
			public List<EventDTO> getEventList() {
				return eventList;
			}
			public void setEventList(List<EventDTO> eventList) {
				this.eventList = eventList;
			}
			public int getEventCurPage() {
				return eventCurPage;
			}
			public void setEventCurPage(int eventCurPage) {
				this.eventCurPage = eventCurPage;
			}
			public int getEventTotalCount() {
				return eventTotalCount;
			}
			public void setEventTotalCount(int eventTotalCount) {
				this.eventTotalCount = eventTotalCount;
			}
			public static int getEventPerPage() {
				return eventPerPage;
			}
			public static void setEventPerPage(int eventPerPage) {
				EventPageDTO.eventPerPage = eventPerPage;
			}
			public String getEventSearchName() {
				return eventSearchName;
			}
			public void setEventSearchName(String eventSearchName) {
				this.eventSearchName = eventSearchName;
			}
			public String getEventSearchValue() {
				return eventSearchValue;
			}
			public void setEventSearchValue(String eventSearchValue) {
				this.eventSearchValue = eventSearchValue;
			}
			public int getEventPerBlock() {
				return eventPerBlock;
			}
			public void setEventPerBlock(int eventPerBlock) {
				this.eventPerBlock = eventPerBlock;
			}
			@Override
			public String toString() {
				return "EventPageDTO [eventList=" + eventList + ", eventCurPage=" + eventCurPage + ", eventTotalCount="
						+ eventTotalCount + ", eventSearchName=" + eventSearchName + ", eventSearchValue="
						+ eventSearchValue + ", eventPerBlock=" + eventPerBlock + "]";
			}
			
			
}
