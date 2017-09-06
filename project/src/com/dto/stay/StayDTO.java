package com.dto.stay;

public class StayDTO {
	private int staynum;
	private String staytitle;
	private String staywriteDay;
	private String staycontent;
	private int stayreadCnt;
	public StayDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StayDTO(int staynum, String staytitle, String staywriteDay, String staycontent, int stayreadCnt) {
		super();
		this.staynum = staynum;
		this.staytitle = staytitle;
		this.staywriteDay = staywriteDay;
		this.staycontent = staycontent;
		this.stayreadCnt = stayreadCnt;
	}
	public int getstaynum() {
		return staynum;
	}
	public void setstaynum(int staynum) {
		this.staynum = staynum;
	}
	public String getstaytitle() {
		return staytitle;
	}
	public void setstaytitle(String staytitle) {
		this.staytitle = staytitle;
	}
	public String getstaywriteDay() {
		return staywriteDay;
	}
	public void setstaywriteDay(String staywriteDay) {
		this.staywriteDay = staywriteDay;
	}
	public String getstaycontent() {
		return staycontent;
	}
	public void setstaycontent(String staycontent) {
		this.staycontent = staycontent;
	}
	public int getstayreadCnt() {
		return stayreadCnt;
	}
	public void setstayreadCnt(int stayreadCnt) {
		this.stayreadCnt = stayreadCnt;
	}
	@Override
	public String toString() {
		return "StayDTO [staynum=" + staynum + ", staytitle=" + staytitle + ", staywriteDay=" + staywriteDay
				+ ", staycontent=" + staycontent + ", stayreadCnt=" + stayreadCnt + "]";
	}
}
