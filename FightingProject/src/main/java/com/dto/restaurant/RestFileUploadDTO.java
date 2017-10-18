package com.dto.restaurant;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.commons.CommonsMultipartFile;



@Alias("RestFileUploadDTO")
public class RestFileUploadDTO {
	
	
	private CommonsMultipartFile restImage;//
	
	private String restName; //
	private int restNum;
	private String restPhone;//
	private String restLocation; //
	private int restPrice;//
	private String restTitle; //
	private String restContent;//
	
	private String restSite;//
	
	private String restType; //
	private int entNum; //

	private String restAddr1;//
	private String restAddr2;///
	public RestFileUploadDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RestFileUploadDTO(CommonsMultipartFile restImage, String restName, int restNum, String restPhone,
			String restLocation, int restPrice, String restTitle, String restContent, String restSite, String restType,
			int entNum, String restAddr1, String restAddr2) {
		super();
		this.restImage = restImage;
		this.restName = restName;
		this.restNum = restNum;
		this.restPhone = restPhone;
		this.restLocation = restLocation;
		this.restPrice = restPrice;
		this.restTitle = restTitle;
		this.restContent = restContent;
		this.restSite = restSite;
		this.restType = restType;
		this.entNum = entNum;
		this.restAddr1 = restAddr1;
		this.restAddr2 = restAddr2;
	}
	public CommonsMultipartFile getRestImage() {
		return restImage;
	}
	public void setRestImage(CommonsMultipartFile restImage) {
		this.restImage = restImage;
	}
	public String getRestName() {
		return restName;
	}
	public void setRestName(String restName) {
		this.restName = restName;
	}
	public int getRestNum() {
		return restNum;
	}
	public void setRestNum(int restNum) {
		this.restNum = restNum;
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
	public String getRestSite() {
		return restSite;
	}
	public void setRestSite(String restSite) {
		this.restSite = restSite;
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
	public String getRestAddr1() {
		return restAddr1;
	}
	public void setRestAddr1(String restAddr1) {
		this.restAddr1 = restAddr1;
	}
	public String getRestAddr2() {
		return restAddr2;
	}
	public void setRestAddr2(String restAddr2) {
		this.restAddr2 = restAddr2;
	}
	@Override
	public String toString() {
		return "RestFileUploadDTO [restImage=" + restImage + ", restName=" + restName + ", restNum=" + restNum
				+ ", restPhone=" + restPhone + ", restLocation=" + restLocation + ", restPrice=" + restPrice
				+ ", restTitle=" + restTitle + ", restContent=" + restContent + ", restSite=" + restSite + ", restType="
				+ restType + ", entNum=" + entNum + ", restAddr1=" + restAddr1 + ", restAddr2=" + restAddr2 + "]";
	}

	
	

}
