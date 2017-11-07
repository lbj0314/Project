package com.dto.fes;

import org.apache.ibatis.type.Alias;

@Alias("FesDTO")
public class FesDTO {

	private int fesNum;
	private int fesPhone;
	private int fesPrice;
	private int fesReadCnt;
	private String fesName;
	private String fesLocation;
	private String fesTitle;
	private String fesContent;
	private String fesWriteday;
	private String fesImage;
	private String fesSite;
	private String fesSeason;
	public FesDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FesDTO(int fesNum, int fesPhone, int fesPrice, int fesReadCnt, String fesName, String fesLocation,
			String fesTitle, String fesContent, String fesWriteday, String fesImage, String fesSite, String fesSeason) {
		super();
		this.fesNum = fesNum;
		this.fesPhone = fesPhone;
		this.fesPrice = fesPrice;
		this.fesReadCnt = fesReadCnt;
		this.fesName = fesName;
		this.fesLocation = fesLocation;
		this.fesTitle = fesTitle;
		this.fesContent = fesContent;
		this.fesWriteday = fesWriteday;
		this.fesImage = fesImage;
		this.fesSite = fesSite;
		this.fesSeason = fesSeason;
	}
	@Override
	public String toString() {
		return "FesDTO [fesNum=" + fesNum + ", fesPhone=" + fesPhone + ", fesPrice=" + fesPrice + ", fesReadCnt="
				+ fesReadCnt + ", fesName=" + fesName + ", fesLocation=" + fesLocation + ", fesTitle=" + fesTitle
				+ ", fesContent=" + fesContent + ", fesWriteday=" + fesWriteday + ", fesImage=" + fesImage
				+ ", fesSite=" + fesSite + ", fesSeason=" + fesSeason + "]";
	}
	public int getFesNum() {
		return fesNum;
	}
	public void setFesNum(int fesNum) {
		this.fesNum = fesNum;
	}
	public int getFesPhone() {
		return fesPhone;
	}
	public void setFesPhone(int fesPhone) {
		this.fesPhone = fesPhone;
	}
	public int getFesPrice() {
		return fesPrice;
	}
	public void setFesPrice(int fesPrice) {
		this.fesPrice = fesPrice;
	}
	public int getFesReadCnt() {
		return fesReadCnt;
	}
	public void setFesReadCnt(int fesReadCnt) {
		this.fesReadCnt = fesReadCnt;
	}
	public String getFesName() {
		return fesName;
	}
	public void setFesName(String fesName) {
		this.fesName = fesName;
	}
	public String getFesLocation() {
		return fesLocation;
	}
	public void setFesLocation(String fesLocation) {
		this.fesLocation = fesLocation;
	}
	public String getFesTitle() {
		return fesTitle;
	}
	public void setFesTitle(String fesTitle) {
		this.fesTitle = fesTitle;
	}
	public String getFesContent() {
		return fesContent;
	}
	public void setFesContent(String fesContent) {
		this.fesContent = fesContent;
	}
	public String getFesWriteday() {
		return fesWriteday;
	}
	public void setFesWriteday(String fesWriteday) {
		this.fesWriteday = fesWriteday;
	}
	public String getFesImage() {
		return fesImage;
	}
	public void setFesImage(String fesImage) {
		this.fesImage = fesImage;
	}
	public String getFesSite() {
		return fesSite;
	}
	public void setFesSite(String fesSite) {
		this.fesSite = fesSite;
	}
	public String getFesSeason() {
		return fesSeason;
	}
	public void setFesSeason(String fesSeason) {
		this.fesSeason = fesSeason;
	}
	
	
	
}
