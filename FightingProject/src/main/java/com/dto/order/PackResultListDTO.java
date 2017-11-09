package com.dto.order;

import org.apache.ibatis.type.Alias;

@Alias("PackResultListDTO")
public class PackResultListDTO {
	private int day;
	private String type;
	private String name;
	private String location;
	private String style;
	private int adultPrice;
	private int kidPrice;
	private String phone;
	public PackResultListDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PackResultListDTO(int day, String type, String name, String location, String style, int adultPrice,
			int kidPrice, String phone) {
		super();
		this.day = day;
		this.type = type;
		this.name = name;
		this.location = location;
		this.style = style;
		this.adultPrice = adultPrice;
		this.kidPrice = kidPrice;
		this.phone = phone;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}
	public int getAdultPrice() {
		return adultPrice;
	}
	public void setAdultPrice(int adultPrice) {
		this.adultPrice = adultPrice;
	}
	public int getKidPrice() {
		return kidPrice;
	}
	public void setKidPrice(int kidPrice) {
		this.kidPrice = kidPrice;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "PackResultListDTO [day=" + day + ", type=" + type + ", name=" + name + ", location=" + location
				+ ", style=" + style + ", adultPrice=" + adultPrice + ", kidPrice=" + kidPrice + ", phone=" + phone
				+ "]";
	}
	
	
	

}
