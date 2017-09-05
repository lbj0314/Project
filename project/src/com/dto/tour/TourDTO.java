package com.dto.tour;

public class TourDTO {

	private int attNum;
	private String attBest100;
	private String attName;
	private String attImage;
	private int attPhone;
	private String attLocation;
	private int attPrice;
	private String attTitle;
	private String attContent;
	private int attWriteday;
	private int attReadCnt;
	private int attRepleCnt;
	private String attSite;
	public TourDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TourDTO(int attNum, String attBest100, String attName, String attImage, int attPhone, String attLocation,
			int attPrice, String attTitle, String attContent, int attWriteday, int attReadCnt, int attRepleCnt,
			String attSite) {
		super();
		this.attNum = attNum;
		this.attBest100 = attBest100;
		this.attName = attName;
		this.attImage = attImage;
		this.attPhone = attPhone;
		this.attLocation = attLocation;
		this.attPrice = attPrice;
		this.attTitle = attTitle;
		this.attContent = attContent;
		this.attWriteday = attWriteday;
		this.attReadCnt = attReadCnt;
		this.attRepleCnt = attRepleCnt;
		this.attSite = attSite;
	}
	public int getAttNum() {
		return attNum;
	}
	public void setAttNum(int attNum) {
		this.attNum = attNum;
	}
	public String getAttBest100() {
		return attBest100;
	}
	public void setAttBest100(String attBest100) {
		this.attBest100 = attBest100;
	}
	public String getAttName() {
		return attName;
	}
	public void setAttName(String attName) {
		this.attName = attName;
	}
	public String getAttImage() {
		return attImage;
	}
	public void setAttImage(String attImage) {
		this.attImage = attImage;
	}
	public int getAttPhone() {
		return attPhone;
	}
	public void setAttPhone(int attPhone) {
		this.attPhone = attPhone;
	}
	public String getAttLocation() {
		return attLocation;
	}
	public void setAttLocation(String attLocation) {
		this.attLocation = attLocation;
	}
	public int getAttPrice() {
		return attPrice;
	}
	public void setAttPrice(int attPrice) {
		this.attPrice = attPrice;
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
	public int getAttWriteday() {
		return attWriteday;
	}
	public void setAttWriteday(int attWriteday) {
		this.attWriteday = attWriteday;
	}
	public int getAttReadCnt() {
		return attReadCnt;
	}
	public void setAttReadCnt(int attReadCnt) {
		this.attReadCnt = attReadCnt;
	}
	public int getAttRepleCnt() {
		return attRepleCnt;
	}
	public void setAttRepleCnt(int attRepleCnt) {
		this.attRepleCnt = attRepleCnt;
	}
	public String getAttSite() {
		return attSite;
	}
	public void setAttSite(String attSite) {
		this.attSite = attSite;
	}
	@Override
	public String toString() {
		return "TourDTO [attNum=" + attNum + ", attBest100=" + attBest100 + ", attName=" + attName + ", attImage="
				+ attImage + ", attPhone=" + attPhone + ", attLocation=" + attLocation + ", attPrice=" + attPrice
				+ ", attTitle=" + attTitle + ", attContent=" + attContent + ", attWriteday=" + attWriteday
				+ ", attReadCnt=" + attReadCnt + ", attRepleCnt=" + attRepleCnt + ", attSite=" + attSite + "]";
	}
	
	
	
}