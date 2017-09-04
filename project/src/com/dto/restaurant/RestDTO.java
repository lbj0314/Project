package com.dto.restaurant;

public class RestDTO {
	private int restnum;
	private String resttitle;
	private String restwriteDay;
	private String restcontent;
	private int restreadCnt;
	public RestDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RestDTO(int restnum, String resttitle, String restwriteDay, String restcontent, int restreadCnt) {
		super();
		this.restnum = restnum;
		this.resttitle = resttitle;
		this.restwriteDay = restwriteDay;
		this.restcontent = restcontent;
		this.restreadCnt = restreadCnt;
	}
	public int getRestnum() {
		return restnum;
	}
	public void setRestnum(int restnum) {
		this.restnum = restnum;
	}
	public String getResttitle() {
		return resttitle;
	}
	public void setResttitle(String resttitle) {
		this.resttitle = resttitle;
	}
	public String getRestwriteDay() {
		return restwriteDay;
	}
	public void setRestwriteDay(String restwriteDay) {
		this.restwriteDay = restwriteDay;
	}
	public String getRestcontent() {
		return restcontent;
	}
	public void setRestcontent(String restcontent) {
		this.restcontent = restcontent;
	}
	public int getRestreadCnt() {
		return restreadCnt;
	}
	public void setRestreadCnt(int restreadCnt) {
		this.restreadCnt = restreadCnt;
	}
	@Override
	public String toString() {
		return "RestDTO [restnum=" + restnum + ", resttitle=" + resttitle + ", restwriteDay=" + restwriteDay
				+ ", restcontent=" + restcontent + ", restreadCnt=" + restreadCnt + "]";
	}
}
