package com.dto.login;

public class EntDTO {
	
	private int entnum;
	private String entid;
	private String entpasswd;
	private String entname;
	private String entlocation;
	private int entphone;
	private int entfax;
	private String entgrade;
	private int entin;
	private String entjoindate;
	private String enttype;
	private String entaddr1;
	private String entaddr2;
	private int entpost1;
	private int entpost2;
	public EntDTO(int entnum, String entid, String entpasswd, String entname, String entlocation, int entphone,
			int entfax, String entgrade, int entin, String entjoindate, String enttype, String entaddr1,
			String entaddr2, int entpost1, int entpost2) {
		this.entnum = entnum;
		this.entid = entid;
		this.entpasswd = entpasswd;
		this.entname = entname;
		this.entlocation = entlocation;
		this.entphone = entphone;
		this.entfax = entfax;
		this.entgrade = entgrade;
		this.entin = entin;
		this.entjoindate = entjoindate;
		this.enttype = enttype;
		this.entaddr1 = entaddr1;
		this.entaddr2 = entaddr2;
		this.entpost1 = entpost1;
		this.entpost2 = entpost2;
	}
	public EntDTO() {}
	@Override
	public String toString() {
		return "EntDTO [entnum=" + entnum + ", entid=" + entid + ", entpasswd=" + entpasswd + ", entname=" + entname
				+ ", entlocation=" + entlocation + ", entphone=" + entphone + ", entfax=" + entfax + ", entgrade="
				+ entgrade + ", entin=" + entin + ", entjoindate=" + entjoindate + ", enttype=" + enttype
				+ ", entaddr1=" + entaddr1 + ", entaddr2=" + entaddr2 + ", entpost1=" + entpost1 + ", entpost2="
				+ entpost2 + "]";
	}
	public int getEntnum() {
		return entnum;
	}
	public void setEntnum(int entnum) {
		this.entnum = entnum;
	}
	public String getEntid() {
		return entid;
	}
	public void setEntid(String entid) {
		this.entid = entid;
	}
	public String getEntpasswd() {
		return entpasswd;
	}
	public void setEntpasswd(String entpasswd) {
		this.entpasswd = entpasswd;
	}
	public String getEntname() {
		return entname;
	}
	public void setEntname(String entname) {
		this.entname = entname;
	}
	public String getEntlocation() {
		return entlocation;
	}
	public void setEntlocation(String entlocation) {
		this.entlocation = entlocation;
	}
	public int getEntphone() {
		return entphone;
	}
	public void setEntphone(int entphone) {
		this.entphone = entphone;
	}
	public int getEntfax() {
		return entfax;
	}
	public void setEntfax(int entfax) {
		this.entfax = entfax;
	}
	public String getEntgrade() {
		return entgrade;
	}
	public void setEntgrade(String entgrade) {
		this.entgrade = entgrade;
	}
	public int getEntin() {
		return entin;
	}
	public void setEntin(int entin) {
		this.entin = entin;
	}
	public String getEntjoindate() {
		return entjoindate;
	}
	public void setEntjoindate(String entjoindate) {
		this.entjoindate = entjoindate;
	}
	public String getEnttype() {
		return enttype;
	}
	public void setEnttype(String enttype) {
		this.enttype = enttype;
	}
	public String getEntaddr1() {
		return entaddr1;
	}
	public void setEntaddr1(String entaddr1) {
		this.entaddr1 = entaddr1;
	}
	public String getEntaddr2() {
		return entaddr2;
	}
	public void setEntaddr2(String entaddr2) {
		this.entaddr2 = entaddr2;
	}
	public int getEntpost1() {
		return entpost1;
	}
	public void setEntpost1(int entpost1) {
		this.entpost1 = entpost1;
	}
	public int getEntpost2() {
		return entpost2;
	}
	public void setEntpost2(int entpost2) {
		this.entpost2 = entpost2;
	}
	
	
}
