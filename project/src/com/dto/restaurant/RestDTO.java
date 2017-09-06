package com.dto.restaurant;

public class RestDTO {
	private int restNum;
	private String restStyle;
	private String restName;
	private int restPrice;
	private String restImage;
	private int restPhone;
	private String restTitle;
	private String restWriteDay;
	private String restContent;
	private int restReadCnt;
	private int restRepleCnt;
	private String restSite;
	private int entNum;
	public RestDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RestDTO(int restNum, String restStyle, String restName, int restPrice, String restImage, int restPhone,
			String restTitle, String restWriteDay, String restContent, int restReadCnt, int restRepleCnt,
			String restSite, int entNum) {
		super();
		this.restNum = restNum;
		this.restStyle = restStyle;
		this.restName = restName;
		this.restPrice = restPrice;
		this.restImage = restImage;
		this.restPhone = restPhone;
		this.restTitle = restTitle;
		this.restWriteDay = restWriteDay;
		this.restContent = restContent;
		this.restReadCnt = restReadCnt;
		this.restRepleCnt = restRepleCnt;
		this.restSite = restSite;
		this.entNum = entNum;
	}
	public int getRestNum() {
		return restNum;
	}
	public void setRestNum(int restNum) {
		this.restNum = restNum;
	}
	public String getRestStyle() {
		return restStyle;
	}
	public void setRestStyle(String restStyle) {
		this.restStyle = restStyle;
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
	public int getRestPhone() {
		return restPhone;
	}
	public void setRestPhone(int restPhone) {
		this.restPhone = restPhone;
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
	@Override
	public String toString() {
		return "RestDTO [restNum=" + restNum + ", restStyle=" + restStyle + ", restName=" + restName + ", restPrice="
				+ restPrice + ", restImage=" + restImage + ", restPhone=" + restPhone + ", restTitle=" + restTitle
				+ ", restWriteDay=" + restWriteDay + ", restContent=" + restContent + ", restReadCnt=" + restReadCnt
				+ ", restRepleCnt=" + restRepleCnt + ", restSite=" + restSite + ", entNum=" + entNum + "]";
	}
	
	
}
