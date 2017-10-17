package com.dto.tour;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class TourFileUploadDTO {
	
	
	private CommonsMultipartFile attImage;//
	
	private String attName; //
	
	private String attPhone;//
	private String attLocation; //
	private int attAdultPrice;//
	private int attKidPrice;//
	private String attTitle; //
	private String attContent;//
	
	private String attSite;//
	
	private String attType; //
	private int entNum; //

	private String attAddr1;//
	private String attAddr2;///

	
	public TourFileUploadDTO(CommonsMultipartFile attImage, String attName, String attPhone, String attLocation,
			int attAdultPrice, int attKidPrice, String attTitle, String attContent, String attSite, String attType,
			int entNum, String attAddr1, String attAddr2) {
		super();
		this.attImage = attImage;
		this.attName = attName;
		this.attPhone = attPhone;
		this.attLocation = attLocation;
		this.attAdultPrice = attAdultPrice;
		this.attKidPrice = attKidPrice;
		this.attTitle = attTitle;
		this.attContent = attContent;
		this.attSite = attSite;
		this.attType = attType;
		this.entNum = entNum;
		this.attAddr1 = attAddr1;
		this.attAddr2 = attAddr2;
	}
	public TourFileUploadDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommonsMultipartFile getAttImage() {
		return attImage;
	}
	public void setAttImage(CommonsMultipartFile attImage) {
		this.attImage = attImage;
	}
	public String getAttName() {
		return attName;
	}
	public void setAttName(String attName) {
		this.attName = attName;
	}
	public String getAttPhone() {
		return attPhone;
	}
	public void setAttPhone(String attPhone) {
		this.attPhone = attPhone;
	}
	public String getAttLocation() {
		return attLocation;
	}
	public void setAttLocation(String attLocation) {
		this.attLocation = attLocation;
	}
	public int getAttAdultPrice() {
		return attAdultPrice;
	}
	public void setAttAdultPrice(int attAdultPrice) {
		this.attAdultPrice = attAdultPrice;
	}
	public int getAttKidPrice() {
		return attKidPrice;
	}
	public void setAttKidPrice(int attKidPrice) {
		this.attKidPrice = attKidPrice;
	}
	public String getAttTitle() {
		return attTitle;
	}
	public void setAttTitle(String attTitle) {
		this.attTitle = attTitle;
	}
	public String getAttContent() {
		return attContent;
	}
	public void setAttContent(String attContent) {
		this.attContent = attContent;
	}
	public String getAttSite() {
		return attSite;
	}
	public void setAttSite(String attSite) {
		this.attSite = attSite;
	}
	public String getAttType() {
		return attType;
	}
	public void setAttType(String attType) {
		this.attType = attType;
	}
	public int getEntNum() {
		return entNum;
	}
	public void setEntNum(int entNum) {
		this.entNum = entNum;
	}
	public String getAttAddr1() {
		return attAddr1;
	}
	public void setAttAddr1(String attAddr1) {
		this.attAddr1 = attAddr1;
	}
	public String getAttAddr2() {
		return attAddr2;
	}
	public void setAttAddr2(String attAddr2) {
		this.attAddr2 = attAddr2;
	}
	@Override
	public String toString() {
		return "TourFileUploadDTO [attImage=" + attImage + ", attName=" + attName + ", attPhone=" + attPhone
				+ ", attLocation=" + attLocation + ", attAdultPrice=" + attAdultPrice + ", attKidPrice=" + attKidPrice
				+ ", attTitle=" + attTitle + ", attContent=" + attContent + ", attSite=" + attSite + ", attType="
				+ attType + ", entNum=" + entNum + ", attAddr1=" + attAddr1 + ", attAddr2=" + attAddr2 + "]";
	}
	

	
	

}
