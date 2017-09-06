package com.dto.stay;

public class StayDTO {
	private int stayNum;
	private String stayType;
	private String stayName;
	private String location;
	private String stayGrade;
	private int stayAdultPrice;
	private int stayKidPrice;
	private int stayPhone;
	private String stayTitle;
	private String stayWriteDay;
	private String stayContent;
	private int stayReadCnt;
	private int stayRepleCnt;
	private String stayImage;
	private String staySite;
	private int entNum;
	public StayDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StayDTO(int stayNum, String stayType, String stayName, String location, String stayGrade, int stayAdultPrice,
			int stayKidPrice, int stayPhone, String stayTitle, String stayWriteDay, String stayContent, int stayReadCnt,
			int stayRepleCnt, String stayImage, String staySite, int entNum) {
		super();
		this.stayNum = stayNum;
		this.stayType = stayType;
		this.stayName = stayName;
		this.location = location;
		this.stayGrade = stayGrade;
		this.stayAdultPrice = stayAdultPrice;
		this.stayKidPrice = stayKidPrice;
		this.stayPhone = stayPhone;
		this.stayTitle = stayTitle;
		this.stayWriteDay = stayWriteDay;
		this.stayContent = stayContent;
		this.stayReadCnt = stayReadCnt;
		this.stayRepleCnt = stayRepleCnt;
		this.stayImage = stayImage;
		this.staySite = staySite;
		this.entNum = entNum;
	}
	public int getStayNum() {
		return stayNum;
	}
	public void setStayNum(int stayNum) {
		this.stayNum = stayNum;
	}
	public String getStayType() {
		return stayType;
	}
	public void setStayType(String stayType) {
		this.stayType = stayType;
	}
	public String getStayName() {
		return stayName;
	}
	public void setStayName(String stayName) {
		this.stayName = stayName;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getStayGrade() {
		return stayGrade;
	}
	public void setStayGrade(String stayGrade) {
		this.stayGrade = stayGrade;
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
	public int getStayPhone() {
		return stayPhone;
	}
	public void setStayPhone(int stayPhone) {
		this.stayPhone = stayPhone;
	}
	public String getStayTitle() {
		return stayTitle;
	}
	public void setStayTitle(String stayTitle) {
		this.stayTitle = stayTitle;
	}
	public String getStayWriteDay() {
		return stayWriteDay;
	}
	public void setStayWriteDay(String stayWriteDay) {
		this.stayWriteDay = stayWriteDay;
	}
	public String getStayContent() {
		return stayContent;
	}
	public void setStayContent(String stayContent) {
		this.stayContent = stayContent;
	}
	public int getStayReadCnt() {
		return stayReadCnt;
	}
	public void setStayReadCnt(int stayReadCnt) {
		this.stayReadCnt = stayReadCnt;
	}
	public int getStayRepleCnt() {
		return stayRepleCnt;
	}
	public void setStayRepleCnt(int stayRepleCnt) {
		this.stayRepleCnt = stayRepleCnt;
	}
	public String getStayImage() {
		return stayImage;
	}
	public void setStayImage(String stayImage) {
		this.stayImage = stayImage;
	}
	public String getStaySite() {
		return staySite;
	}
	public void setStaySite(String staySite) {
		this.staySite = staySite;
	}
	public int getEntNum() {
		return entNum;
	}
	public void setEntNum(int entNum) {
		this.entNum = entNum;
	}
	@Override
	public String toString() {
		return "StayDTO [stayNum=" + stayNum + ", stayType=" + stayType + ", stayName=" + stayName + ", location="
				+ location + ", stayGrade=" + stayGrade + ", stayAdultPrice=" + stayAdultPrice + ", stayKidPrice="
				+ stayKidPrice + ", stayPhone=" + stayPhone + ", stayTitle=" + stayTitle + ", stayWriteDay="
				+ stayWriteDay + ", stayContent=" + stayContent + ", stayReadCnt=" + stayReadCnt + ", stayRepleCnt="
				+ stayRepleCnt + ", stayImage=" + stayImage + ", staySite=" + staySite + ", entNum=" + entNum + "]";
	}
	
}
