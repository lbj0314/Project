package com.dto.event;

import org.apache.ibatis.type.Alias;

@Alias("EventDTO")
public class EventDTO {

	private int eventNonum;
	private String eventNotitle;
	private String eventNowriteDay;
	private String eventNocontent;
	private int eventNoreadCnt;
	private int eventAdmnum;
	public EventDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EventDTO(int eventNonum, String eventNotitle, String eventNowriteDay, String eventNocontent,
			int eventNoreadCnt, int eventAdmnum) {
		super();
		this.eventNonum = eventNonum;
		this.eventNotitle = eventNotitle;
		this.eventNowriteDay = eventNowriteDay;
		this.eventNocontent = eventNocontent;
		this.eventNoreadCnt = eventNoreadCnt;
		this.eventAdmnum = eventAdmnum;
	}
	public int getEventNonum() {
		return eventNonum;
	}
	public void setEventNonum(int eventNonum) {
		this.eventNonum = eventNonum;
	}
	public String getEventNotitle() {
		return eventNotitle;
	}
	public void setEventNotitle(String eventNotitle) {
		this.eventNotitle = eventNotitle;
	}
	public String getEventNowriteDay() {
		return eventNowriteDay;
	}
	public void setEventNowriteDay(String eventNowriteDay) {
		this.eventNowriteDay = eventNowriteDay;
	}
	public String getEventNocontent() {
		return eventNocontent;
	}
	public void setEventNocontent(String eventNocontent) {
		this.eventNocontent = eventNocontent;
	}
	public int getEventNoreadCnt() {
		return eventNoreadCnt;
	}
	public void setEventNoreadCnt(int eventNoreadCnt) {
		this.eventNoreadCnt = eventNoreadCnt;
	}
	public int getEventAdmnum() {
		return eventAdmnum;
	}
	public void setEventAdmnum(int eventAdmnum) {
		this.eventAdmnum = eventAdmnum;
	}
	@Override
	public String toString() {
		return "EventDTO [eventNonum=" + eventNonum + ", eventNotitle=" + eventNotitle + ", eventNowriteDay="
				+ eventNowriteDay + ", eventNocontent=" + eventNocontent + ", eventNoreadCnt=" + eventNoreadCnt
				+ ", eventAdmnum=" + eventAdmnum + "]";
	}
	
}
