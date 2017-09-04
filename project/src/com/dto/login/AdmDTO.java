package com.dto.login;

public class AdmDTO {
	
	private int admnum;
	private String admid;
	private String admpasswd;
	private String admgrade;
	public AdmDTO(int admnum, String admid, String admpasswd, String admgrade) {
		this.admnum = admnum;
		this.admid = admid;
		this.admpasswd = admpasswd;
		this.admgrade = admgrade;
	}
	@Override
	public String toString() {
		return "AdmDTO [admnum=" + admnum + ", admid=" + admid + ", admpasswd=" + admpasswd + ", admgrade=" + admgrade
				+ "]";
	}
	public AdmDTO() {}
	public int getAdmnum() {
		return admnum;
	}
	public void setAdmnum(int admnum) {
		this.admnum = admnum;
	}
	public String getAdmid() {
		return admid;
	}
	public void setAdmid(String admid) {
		this.admid = admid;
	}
	public String getAdmpasswd() {
		return admpasswd;
	}
	public void setAdmpasswd(String admpasswd) {
		this.admpasswd = admpasswd;
	}
	public String getAdmgrade() {
		return admgrade;
	}
	public void setAdmgrade(String admgrade) {
		this.admgrade = admgrade;
	}
	
	
}
