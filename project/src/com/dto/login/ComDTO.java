package com.dto.login;

public class ComDTO {
	
	private int comnum;
	private String comid;
	private String compasswd;
	private String comname;
	private long comssn;
	private long comphone;
	private String comgrade;
	private String comemail;
	private String comaddr1;
	private String comaddr2;
	private int compost1;
	private int compost2;
	
	
	public ComDTO(String comid, String compasswd, String comname, long comssn, long comphone, String comemail,
			String comaddr1, String comaddr2, int compost1, int compost2) {
		super();
		this.comid = comid;
		this.compasswd = compasswd;
		this.comname = comname;
		this.comssn = comssn;
		this.comphone = comphone;
		this.comemail = comemail;
		this.comaddr1 = comaddr1;
		this.comaddr2 = comaddr2;
		this.compost1 = compost1;
		this.compost2 = compost2;
	}
	public ComDTO() {}
	public ComDTO(int comnum, String comid, String compasswd, String comname, long comssn, long comphone,
			String comgrade, String comemail, String comaddr1, String comaddr2, int compost1, int compost2) {
		this.comnum = comnum;
		this.comid = comid;
		this.compasswd = compasswd;
		this.comname = comname;
		this.comssn = comssn;
		this.comphone = comphone;
		this.comgrade = comgrade;
		this.comemail = comemail;
		this.comaddr1 = comaddr1;
		this.comaddr2 = comaddr2;
		this.compost1 = compost1;
		this.compost2 = compost2;
	}
	@Override
	public String toString() {
		return "ComDTO [comnum=" + comnum + ", comid=" + comid + ", compasswd=" + compasswd + ", comname=" + comname
				+ ", comssn=" + comssn + ", comphone=" + comphone + ", comgrade=" + comgrade + ", comemail=" + comemail
				+ ", comaddr1=" + comaddr1 + ", comaddr2=" + comaddr2 + ", compost1=" + compost1 + ", compost2="
				+ compost2 + "]";
	}
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
	public long getComssn() {
		return comssn;
	}
	public void setComssn(long comssn) {
		this.comssn = comssn;
	}
	public long getComphone() {
		return comphone;
	}
	public void setComphone(long comphone) {
		this.comphone = comphone;
	}
	public String getComgrade() {
		return comgrade;
	}
	public void setComgrade(String comgrade) {
		this.comgrade = comgrade;
	}
	public String getComemail() {
		return comemail;
	}
	public void setComemail(String comemail) {
		this.comemail = comemail;
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
