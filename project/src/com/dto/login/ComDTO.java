package com.dto.login;

public class ComDTO {
	
	private int comnum;
	private String comid;
	private String compasswd;
	private String comname;
	private int comssn;
	private int comphone;
	private String comgrade;
	private String comjoindate;
	private String cmomemail;
	private String comaddr1;
	private String comaddr2;
	private int compost1;
	private int compost2;
	
	@Override
	public String toString() {
		return "ComDTO [comnum=" + comnum + ", comid=" + comid + ", compasswd=" + compasswd + ", comname=" + comname
				+ ", comssn=" + comssn + ", comphone=" + comphone + ", comgrade=" + comgrade + ", comjoindate="
				+ comjoindate + ", cmomemail=" + cmomemail + ", comaddr1=" + comaddr1 + ", comaddr2=" + comaddr2
				+ ", compost1=" + compost1 + ", compost2=" + compost2 + "]";
	}

	public ComDTO(int comnum, String comid, String compasswd, String comname, int comssn, int comphone, String comgrade,
			String comjoindate, String cmomemail, String comaddr1, String comaddr2, int compost1, int compost2) {
		this.comnum = comnum;
		this.comid = comid;
		this.compasswd = compasswd;
		this.comname = comname;
		this.comssn = comssn;
		this.comphone = comphone;
		this.comgrade = comgrade;
		this.comjoindate = comjoindate;
		this.cmomemail = cmomemail;
		this.comaddr1 = comaddr1;
		this.comaddr2 = comaddr2;
		this.compost1 = compost1;
		this.compost2 = compost2;
	}

	public ComDTO() {}

	public int getComnum() {
		return comnum;
	}

	public void setComnum(int comnum) {
		this.comnum = comnum;
	}

	public String getComid() {
		return comid;
	}

	public void setComid(String comid) {
		this.comid = comid;
	}

	public String getCompasswd() {
		return compasswd;
	}

	public void setCompasswd(String compasswd) {
		this.compasswd = compasswd;
	}

	public String getComname() {
		return comname;
	}

	public void setComname(String comname) {
		this.comname = comname;
	}

	public int getComssn() {
		return comssn;
	}

	public void setComssn(int comssn) {
		this.comssn = comssn;
	}

	public int getComphone() {
		return comphone;
	}

	public void setComphone(int comphone) {
		this.comphone = comphone;
	}

	public String getComgrade() {
		return comgrade;
	}

	public void setComgrade(String comgrade) {
		this.comgrade = comgrade;
	}

	public String getComjoindate() {
		return comjoindate;
	}

	public void setComjoindate(String comjoindate) {
		this.comjoindate = comjoindate;
	}

	public String getCmomemail() {
		return cmomemail;
	}

	public void setCmomemail(String cmomemail) {
		this.cmomemail = cmomemail;
	}

	public String getComaddr1() {
		return comaddr1;
	}

	public void setComaddr1(String comaddr1) {
		this.comaddr1 = comaddr1;
	}

	public String getComaddr2() {
		return comaddr2;
	}

	public void setComaddr2(String comaddr2) {
		this.comaddr2 = comaddr2;
	}

	public int getCompost1() {
		return compost1;
	}

	public void setCompost1(int compost1) {
		this.compost1 = compost1;
	}

	public int getCompost2() {
		return compost2;
	}

	public void setCompost2(int compost2) {
		this.compost2 = compost2;
	}
	
	
	
}
