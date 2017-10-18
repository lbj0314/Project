package com.dto.stay;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.commons.CommonsMultipartFile;



@Alias("StayFileUploadDTO")
public class StayFileUploadDTO {
	
	
	private CommonsMultipartFile stayImage;//
	
	private String stayName; //
	private int stayNum;
	private String stayPhone;//
	private String stayLocation; //
	private int stayAdultPrice;//
	private int stayKidPrice;//
	private String stayTitle; //
	private String stayContent;//
	
	private String staySite;//
	
	private String stayType; //
	private int entNum; //

	private String stayAddr1;//
	private String stayAddr2;///
	private String stayGrade;
	public StayFileUploadDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StayFileUploadDTO(CommonsMultipartFile stayImage, String stayName, int stayNum, String stayPhone,
			String stayLocation, int stayAdultPrice, int stayKidPrice, String stayTitle, String stayContent,
			String staySite, String stayType, int entNum, String stayAddr1, String stayAddr2, String stayGrade) {
		super();
		this.stayImage = stayImage;
		this.stayName = stayName;
		this.stayNum = stayNum;
		this.stayPhone = stayPhone;
		this.stayLocation = stayLocation;
		this.stayAdultPrice = stayAdultPrice;
		this.stayKidPrice = stayKidPrice;
		this.stayTitle = stayTitle;
		this.stayContent = stayContent;
		this.staySite = staySite;
		this.stayType = stayType;
		this.entNum = entNum;
		this.stayAddr1 = stayAddr1;
		this.stayAddr2 = stayAddr2;
		this.stayGrade = stayGrade;
	}
	public CommonsMultipartFile getStayImage() {
		return stayImage;
	}
	public void setStayImage(CommonsMultipartFile stayImage) {
		this.stayImage = stayImage;
	}
	public String getStayName() {
		return stayName;
	}
	public void setStayName(String stayName) {
		this.stayName = stayName;
	}
	public int getStayNum() {
		return stayNum;
	}
	public void setStayNum(int stayNum) {
		this.stayNum = stayNum;
	}
	public String getStayPhone() {
		return stayPhone;
	}
	public void setStayPhone(String stayPhone) {
		this.stayPhone = stayPhone;
	}
	public String getStayLocation() {
		return stayLocation;
	}
	public void setStayLocation(String stayLocation) {
		this.stayLocation = stayLocation;
	}
	public int getStayAdultPrice() {
		return stayAdultPrice;
	}
	public void setStayAdultPrice(int stayAdultPrice) {
		this.stayAdultPrice = stayAdultPrice;
	}
	public int getStayKidPrice() {
		return stayKidPrice;
	}
	public void setStayKidPrice(int stayKidPrice) {
		this.stayKidPrice = stayKidPrice;
	}
	public String getStayTitle() {
		return stayTitle;
	}
	public void setStayTitle(String stayTitle) {
		this.stayTitle = stayTitle;
	}
	public String getStayContent() {
		return stayContent;
	}
	public void setStayContent(String stayContent) {
		this.stayContent = stayContent;
	}
	public String getStaySite() {
		return staySite;
	}
	public void setStaySite(String staySite) {
		this.staySite = staySite;
	}
	public String getStayType() {
		return stayType;
	}
	public void setStayType(String stayType) {
		this.stayType = stayType;
	}
	public int getEntNum() {
		return entNum;
	}
	public void setEntNum(int entNum) {
		this.entNum = entNum;
	}
	public String getStayAddr1() {
		return stayAddr1;
	}
	public void setStayAddr1(String stayAddr1) {
		this.stayAddr1 = stayAddr1;
	}
	public String getStayAddr2() {
		return stayAddr2;
	}
	public void setStayAddr2(String stayAddr2) {
		this.stayAddr2 = stayAddr2;
	}
	public String getStayGrade() {
		return stayGrade;
	}
	public void setStayGrade(String stayGrade) {
		this.stayGrade = stayGrade;
	}
	@Override
	public String toString() {
		return "StayFileUploadDTO [stayImage=" + stayImage + ", stayName=" + stayName + ", stayNum=" + stayNum
				+ ", stayPhone=" + stayPhone + ", stayLocation=" + stayLocation + ", stayAdultPrice=" + stayAdultPrice
				+ ", stayKidPrice=" + stayKidPrice + ", stayTitle=" + stayTitle + ", stayContent=" + stayContent
				+ ", staySite=" + staySite + ", stayType=" + stayType + ", entNum=" + entNum + ", stayAddr1="
				+ stayAddr1 + ", stayAddr2=" + stayAddr2 + ", stayGrade=" + stayGrade + "]";
	}
	
	
	

	
	

}
