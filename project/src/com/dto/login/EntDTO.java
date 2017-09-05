package com.dto.login;

public class EntDTO {
	
	private int entnum;
	private String entid;
	private String entpasswd;
	private String entname;
	private String entlocation;
	private int entphone;
	private int entcellphone;
	private int entfax;
	private int entin;
	private String enttype;
	
	
	public EntDTO(String entid, String entpasswd, String entname, String entlocation, int entphone, int entcellphone,
			int entfax, int entin, String enttype) {
		super();
		this.entid = entid;
		this.entpasswd = entpasswd;
		this.entname = entname;
		this.entlocation = entlocation;
		this.entphone = entphone;
		this.entcellphone = entcellphone;
		this.entfax = entfax;
		this.entin = entin;
		this.enttype = enttype;
	}
	public EntDTO() {}
	public EntDTO(int entnum, String entid, String entpasswd, String entname, String entlocation, int entphone,
			int entcellphone, int entfax, int entin, String enttype) {
		this.entnum = entnum;
		this.entid = entid;
		this.entpasswd = entpasswd;
		this.entname = entname;
		this.entlocation = entlocation;
		this.entphone = entphone;
		this.entcellphone = entcellphone;
		this.entfax = entfax;
		this.entin = entin;
		this.enttype = enttype;
	}
	@Override
	public String toString() {
		return "EntDTO [entnum=" + entnum + ", entid=" + entid + ", entpasswd=" + entpasswd + ", entname=" + entname
				+ ", entlocation=" + entlocation + ", entphone=" + entphone + ", entcellphone=" + entcellphone
				+ ", entfax=" + entfax + ", entin=" + entin + ", enttype=" + enttype + "]";
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
	public int getEntcellphone() {
		return entcellphone;
	}
	public void setEntcellphone(int entcellphone) {
		this.entcellphone = entcellphone;
	}
	public int getEntfax() {
		return entfax;
	}
	public void setEntfax(int entfax) {
		this.entfax = entfax;
	}
	public int getEntin() {
		return entin;
	}
	public void setEntin(int entin) {
		this.entin = entin;
	}
	public String getEnttype() {
		return enttype;
	}
	public void setEnttype(String enttype) {
		this.enttype = enttype;
	}
	
	
}
