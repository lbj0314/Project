package com.dto.fes;

public class FesDTO {

	private int FesNum;
	private int FesPhone;
	private int FesPrice;
	private int FesReadCnt;
	private String FesName;
	private String FesLocation;
	private String FesTitle;
	private String FesContent;
	private String FesWriteday;
	private String FesImage;
	private String FesSite;
	private String FesSeason;
	
	public FesDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FesDTO(int fesNum, int fesPhone, int fesPrice, int fesReadCnt, String fesName, String fesLocation,
			String fesTitle, String fesContent, String fesWriteday, String fesImage, String fesSite, String fesSeason) {
		super();
		FesNum = fesNum;
		FesPhone = fesPhone;
		FesPrice = fesPrice;
		FesReadCnt = fesReadCnt;
		FesName = fesName;
		FesLocation = fesLocation;
		FesTitle = fesTitle;
		FesContent = fesContent;
		FesWriteday = fesWriteday;
		FesImage = fesImage;
		FesSite = fesSite;
		FesSeason = fesSeason;
	}
	public int getFesNum() {
		return FesNum;
	}
	public void setFesNum(int fesNum) {
		FesNum = fesNum;
	}
	public int getFesPhone() {
		return FesPhone;
	}
	public void setFesPhone(int fesPhone) {
		FesPhone = fesPhone;
	}
	public int getFesPrice() {
		return FesPrice;
	}
	public void setFesPrice(int fesPrice) {
		FesPrice = fesPrice;
	}
	public int getFesReadCnt() {
		return FesReadCnt;
	}
	public void setFesReadCnt(int fesReadCnt) {
		FesReadCnt = fesReadCnt;
	}
	public String getFesName() {
		return FesName;
	}
	public void setFesName(String fesName) {
		FesName = fesName;
	}
	public String getFesLocation() {
		return FesLocation;
	}
	public void setFesLocation(String fesLocation) {
		FesLocation = fesLocation;
	}
	public String getFesTitle() {
		return FesTitle;
	}
	public void setFesTitle(String fesTitle) {
		FesTitle = fesTitle;
	}
	public String getFesContent() {
		return FesContent;
	}
	public void setFesContent(String fesContent) {
		FesContent = fesContent;
	}
	public String getFesWriteday() {
		return FesWriteday;
	}
	public void setFesWriteday(String fesWriteday) {
		FesWriteday = fesWriteday;
	}
	public String getFesImage() {
		return FesImage;
	}
	public void setFesImage(String fesImage) {
		FesImage = fesImage;
	}
	public String getFesSite() {
		return FesSite;
	}
	public void setFesSite(String fesSite) {
		FesSite = fesSite;
	}
	public String getFesSeason() {
		return FesSeason;
	}
	public void setFesSeason(String fesSeason) {
		FesSeason = fesSeason;
	}
	@Override
	public String toString() {
		return "FesDTO [FesNum=" + FesNum + ", FesPhone=" + FesPhone + ", FesPrice=" + FesPrice + ", FesReadCnt="
				+ FesReadCnt + ", FesName=" + FesName + ", FesLocation=" + FesLocation + ", FesTitle=" + FesTitle
				+ ", FesContent=" + FesContent + ", FesWriteday=" + FesWriteday + ", FesImage=" + FesImage
				+ ", FesSite=" + FesSite + ", FesSeason=" + FesSeason + "]";
	}
	
	
	
}
