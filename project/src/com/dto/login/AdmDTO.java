package com.dto.login;

public class AdmDTO {
	
	private int admnum;
	private String admid;
	private String admpasswd;
	
	
	public AdmDTO(String admid, String admpasswd) {
		super();
		this.admid = admid;
		this.admpasswd = admpasswd;
	}
	public AdmDTO() {}
	public AdmDTO(int admnum, String admid, String admpasswd) {
		this.admnum = admnum;
		this.admid = admid;
		this.admpasswd = admpasswd;
	}
	@Override
	public String toString() {
		return "AdmDTO [admnum=" + admnum + ", admid=" + admid + ", admpasswd=" + admpasswd + "]";
	}
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
	
}
