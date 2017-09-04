package com.dto.notice;

public class NoticeDTO {
	private int nonum;
	private String notitle;
	private String nowriteDay;
	private String nocontent;
	private int noreadCnt;
	public NoticeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeDTO(int nonum, String notitle, String nowriteDay, String nocontent, int noreadCnt) {
		super();
		this.nonum = nonum;
		this.notitle = notitle;
		this.nowriteDay = nowriteDay;
		this.nocontent = nocontent;
		this.noreadCnt = noreadCnt;
	}
	public int getNonum() {
		return nonum;
	}
	public void setNonum(int nonum) {
		this.nonum = nonum;
	}
	public String getNotitle() {
		return notitle;
	}
	public void setNotitle(String notitle) {
		this.notitle = notitle;
	}
	public String getNowriteDay() {
		return nowriteDay;
	}
	public void setNowriteDay(String nowriteDay) {
		this.nowriteDay = nowriteDay;
	}
	public String getNocontent() {
		return nocontent;
	}
	public void setNocontent(String nocontent) {
		this.nocontent = nocontent;
	}
	public int getNoreadCnt() {
		return noreadCnt;
	}
	public void setNoreadCnt(int noreadCnt) {
		this.noreadCnt = noreadCnt;
	}
	@Override
	public String toString() {
		return "NoticeDTO [nonum=" + nonum + ", notitle=" + notitle + ", nowriteDay=" + nowriteDay + ", nocontent="
				+ nocontent + ", noreadCnt=" + noreadCnt + "]";
	}
	
	
	

}
