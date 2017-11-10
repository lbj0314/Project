package com.dto.order;

import org.apache.ibatis.type.Alias;

@Alias("PackListDTO")
public class PackListDTO {
	private int packListNum;
	private String type;
	private int day;
	private int packOrderNum;
	private int comNum;
	private int typeNum;
	private int state;
	private String endDay;
	public PackListDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PackListDTO(int packListNum, String type, int day, int packOrderNum, int comNum, int typeNum, int state,
			String endDay) {
		super();
		this.packListNum = packListNum;
		this.type = type;
		this.day = day;
		this.packOrderNum = packOrderNum;
		this.comNum = comNum;
		this.typeNum = typeNum;
		this.state = state;
		this.endDay = endDay;
	}
	public int getPackListNum() {
		return packListNum;
	}
	public void setPackListNum(int packListNum) {
		this.packListNum = packListNum;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public int getPackOrderNum() {
		return packOrderNum;
	}
	public void setPackOrderNum(int packOrderNum) {
		this.packOrderNum = packOrderNum;
	}
	public int getComNum() {
		return comNum;
	}
	public void setComNum(int comNum) {
		this.comNum = comNum;
	}
	public int getTypeNum() {
		return typeNum;
	}
	public void setTypeNum(int typeNum) {
		this.typeNum = typeNum;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	@Override
	public String toString() {
		return "PackListDTO [packListNum=" + packListNum + ", type=" + type + ", day=" + day + ", packOrderNum="
				+ packOrderNum + ", comNum=" + comNum + ", typeNum=" + typeNum + ", state=" + state + ", endDay="
				+ endDay + ", getPackListNum()=" + getPackListNum() + ", getType()=" + getType() + ", getDay()="
				+ getDay() + ", getPackOrderNum()=" + getPackOrderNum() + ", getComNum()=" + getComNum()
				+ ", getTypeNum()=" + getTypeNum() + ", getState()=" + getState() + ", getEndDay()=" + getEndDay()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	
	
	
	

}
