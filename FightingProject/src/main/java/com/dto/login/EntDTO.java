package com.dto.login;

public class EntDTO {
	
	private int entnum;
	private String entid;
	private String entpasswd;
	private String entname;
	private String entlocation;
	private long entphone;
	private long entcellphone;
	private long entfax;
	private long entin;
	private String enttype;
	
	
	public EntDTO(String entid, String entpasswd, String entname, String entlocation, long entphone, long entcellphone,
			long entfax, long entin, String enttype) {
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
	public EntDTO(int entnum, String entid, String entpasswd, String entname, String entlocation, long entphone,
			long entcellphone, long entfax, long entin, String enttype) {
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
	public long getEntphone() {
		return entphone;
	}
	public void setEntphone(long entphone) {
		this.entphone = entphone;
	}
	public long getEntcellphone() {
		return entcellphone;
	}
	public void setEntcellphone(long entcellphone) {
		this.entcellphone = entcellphone;
	}
	public long getEntfax() {
		return entfax;
	}
	public void setEntfax(long entfax) {
		this.entfax = entfax;
	}
	public long getEntin() {
		return entin;
	}
	public void setEntin(long entin) {
		this.entin = entin;
	}
	public String getEnttype() {
		return enttype;
	}
	public void setEnttype(String enttype) {
		this.enttype = enttype;
	}
	
	
}
