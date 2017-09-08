package com.dto.restaurant;

public class RestDTO {
	private int restNum;
	private String restName;
	private String restImage;
	private String restPhone;
	private String restLocation;
	private int restPrice;
	private String restTitle;
	private String restContent;
	private String restWriteDay;
	private int restReadCnt;
	private int restRepleCnt;
	private String restSite;
	private int restGoods;
	private String restType;
	private int entNum;
	private String restImageClone;
	public RestDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RestDTO(int restNum, String restName, String restImage, String restPhone, String restLocation, int restPrice,
			String restTitle, String restContent, String restWriteDay, int restReadCnt, int restRepleCnt,
			String restSite, int restGoods, String restType, int entNum, String restImageClone) {
		super();
		this.restNum = restNum;
		this.restName = restName;
		this.restImage = restImage;
		this.restPhone = restPhone;
		this.restLocation = restLocation;
		this.restPrice = restPrice;
		this.restTitle = restTitle;
		this.restContent = restContent;
		this.restWriteDay = restWriteDay;
		this.restReadCnt = restReadCnt;
		this.restRepleCnt = restRepleCnt;
		this.restSite = restSite;
		this.restGoods = restGoods;
		this.restType = restType;
		this.entNum = entNum;
		this.restImageClone = restImageClone;
	}
	public int getRestNum() {
		return restNum;
	}
	public void setRestNum(int restNum) {
		this.restNum = restNum;
	}
	public String getRestName() {
		return restName;
	}
	public void setRestName(String restName) {
		this.restName = restName;
	}
	public String getRestImage() {
		return restImage;
	}
	public void setRestImage(String restImage) {
		this.restImage = restImage;
	}
	public String getRestPhone() {
		return restPhone;
	}
	public void setRestPhone(String restPhone) {
		this.restPhone = restPhone;
	}
	public String getRestLocation() {
		return restLocation;
	}
	public void setRestLocation(String restLocation) {
		this.restLocation = restLocation;
	}
	public int getRestPrice() {
		return restPrice;
	}
	public void setRestPrice(int restPrice) {
		this.restPrice = restPrice;
	}
	public String getRestTitle() {
		return restTitle;
	}
	public void setRestTitle(String restTitle) {
		this.restTitle = restTitle;
	}
	public String getRestContent() {
		return restContent;
	}
	public void setRestContent(String restContent) {
		this.restContent = restContent;
	}
	public String getRestWriteDay() {
		return restWriteDay;
	}
	public void setRestWriteDay(String restWriteDay) {
		this.restWriteDay = restWriteDay;
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
	public int getRestGoods() {
		return restGoods;
	}
	public void setRestGoods(int restGoods) {
		this.restGoods = restGoods;
	}
	public String getRestType() {
		return restType;
	}
	public void setRestType(String restType) {
		this.restType = restType;
	}
	public int getEntNum() {
		return entNum;
	}
	public void setEntNum(int entNum) {
		this.entNum = entNum;
	}
	public String getRestImageClone() {
		return restImageClone;
	}
	public void setRestImageClone(String restImageClone) {
		this.restImageClone = restImageClone;
	}
	@Override
	public String toString() {
		return "RestDTO [restNum=" + restNum + ", restName=" + restName + ", restImage=" + restImage + ", restPhone="
				+ restPhone + ", restLocation=" + restLocation + ", restPrice=" + restPrice + ", restTitle=" + restTitle
				+ ", restContent=" + restContent + ", restWriteDay=" + restWriteDay + ", restReadCnt=" + restReadCnt
				+ ", restRepleCnt=" + restRepleCnt + ", restSite=" + restSite + ", restGoods=" + restGoods
				+ ", restType=" + restType + ", entNum=" + entNum + ", restImageClone=" + restImageClone + "]";
	}
	

}
