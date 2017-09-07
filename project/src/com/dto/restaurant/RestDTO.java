package com.dto.restaurant;

public class RestDTO {
	private int restNum;
	private String restType;
	private String restName;
	private int restPrice;
	private String restImage;
	private String restImageClone;
	private int restPhone;
	private String restLocation;
	private String restTitle;
	private String restWriteDay;
	private String restContent;
	private int restReadCnt;
	private int restRepleCnt;
	private String restSite;
	private int entNum;
	private int restGoods;
	public RestDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RestDTO(int restNum, String restType, String restName, int restPrice, String restImage,
			String restImageClone, int restPhone, String restLocation, String restTitle, String restWriteDay,
			String restContent, int restReadCnt, int restRepleCnt, String restSite, int entNum, int restGoods) {
		super();
		this.restNum = restNum;
		this.restType = restType;
		this.restName = restName;
		this.restPrice = restPrice;
		this.restImage = restImage;
		this.restImageClone = restImageClone;
		this.restPhone = restPhone;
		this.restLocation = restLocation;
		this.restTitle = restTitle;
		this.restWriteDay = restWriteDay;
		this.restContent = restContent;
		this.restReadCnt = restReadCnt;
		this.restRepleCnt = restRepleCnt;
		this.restSite = restSite;
		this.entNum = entNum;
		this.restGoods = restGoods;
	}
	public int getRestNum() {
		return restNum;
	}
	public void setRestNum(int restNum) {
		this.restNum = restNum;
	}
	public String getRestType() {
		return restType;
	}
	public void setRestType(String restType) {
		this.restType = restType;
	}
	public String getRestName() {
		return restName;
	}
	public void setRestName(String restName) {
		this.restName = restName;
	}
	public int getRestPrice() {
		return restPrice;
	}
	public void setRestPrice(int restPrice) {
		this.restPrice = restPrice;
	}
	public String getRestImage() {
		return restImage;
	}
	public void setRestImage(String restImage) {
		this.restImage = restImage;
	}
	public String getRestImageClone() {
		return restImageClone;
	}
	public void setRestImageClone(String restImageClone) {
		this.restImageClone = restImageClone;
	}
	public int getRestPhone() {
		return restPhone;
	}
	public void setRestPhone(int restPhone) {
		this.restPhone = restPhone;
	}
	public String getRestLocation() {
		return restLocation;
	}
	public void setRestLocation(String restLocation) {
		this.restLocation = restLocation;
	}
	public String getRestTitle() {
		return restTitle;
	}
	public void setRestTitle(String restTitle) {
		this.restTitle = restTitle;
	}
	public String getRestWriteDay() {
		return restWriteDay;
	}
	public void setRestWriteDay(String restWriteDay) {
		this.restWriteDay = restWriteDay;
	}
	public String getRestContent() {
		return restContent;
	}
	public void setRestContent(String restContent) {
		this.restContent = restContent;
	}
	public int getRestReadCnt() {
		return restReadCnt;
	}
	public void setRestReadCnt(int restReadCnt) {
		this.restReadCnt = restReadCnt;
	}
	public int getRestRepleCnt() {
		return restRepleCnt;
	}
	public void setRestRepleCnt(int restRepleCnt) {
		this.restRepleCnt = restRepleCnt;
	}
	public String getRestSite() {
		return restSite;
	}
	public void setRestSite(String restSite) {
		this.restSite = restSite;
	}
	public int getEntNum() {
		return entNum;
	}
	public void setEntNum(int entNum) {
		this.entNum = entNum;
	}
	public int getRestGoods() {
		return restGoods;
	}
	public void setRestGoods(int restGoods) {
		this.restGoods = restGoods;
	}
	@Override
	public String toString() {
		return "RestDTO [restNum=" + restNum + ", restType=" + restType + ", restName=" + restName + ", restPrice="
				+ restPrice + ", restImage=" + restImage + ", restImageClone=" + restImageClone + ", restPhone="
				+ restPhone + ", restLocation=" + restLocation + ", restTitle=" + restTitle + ", restWriteDay="
				+ restWriteDay + ", restContent=" + restContent + ", restReadCnt=" + restReadCnt + ", restRepleCnt="
				+ restRepleCnt + ", restSite=" + restSite + ", entNum=" + entNum + ", restGoods=" + restGoods + "]";
	}
	
	
}
