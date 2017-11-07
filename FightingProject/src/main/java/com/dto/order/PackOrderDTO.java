package com.dto.order;

import org.apache.ibatis.type.Alias;

@Alias("PackOrderDTO")
public class PackOrderDTO {
	private int packOrderNum;
	private String startDay;
	private String endDay;
	private String packName;
	private int adult;
	private int kid;
	private String payment;
	private int price;
	private int comNum;
	public PackOrderDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PackOrderDTO(int packOrderNum, String startDay, String endDay, String packName, int adult, int kid,
			String payment, int price, int comNum) {
		super();
		this.packOrderNum = packOrderNum;
		this.startDay = startDay;
		this.endDay = endDay;
		this.packName = packName;
		this.adult = adult;
		this.kid = kid;
		this.payment = payment;
		this.price = price;
		this.comNum = comNum;
	}
	public int getPackOrderNum() {
		return packOrderNum;
	}
	public void setPackOrderNum(int packOrderNum) {
		this.packOrderNum = packOrderNum;
	}
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	public String getPackName() {
		return packName;
	}
	public void setPackName(String packName) {
		this.packName = packName;
	}
	public int getAdult() {
		return adult;
	}
	public void setAdult(int adult) {
		this.adult = adult;
	}
	public int getKid() {
		return kid;
	}
	public void setKid(int kid) {
		this.kid = kid;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getComNum() {
		return comNum;
	}
	public void setComNum(int comNum) {
		this.comNum = comNum;
	}
	@Override
	public String toString() {
		return "PackOrderDTO [packOrderNum=" + packOrderNum + ", startDay=" + startDay + ", endDay=" + endDay
				+ ", packName=" + packName + ", adult=" + adult + ", kid=" + kid + ", payment=" + payment + ", price="
				+ price + ", comNum=" + comNum + "]";
	}
	
	
	

}
