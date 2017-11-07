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
	public PackListDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PackListDTO(int packListNum, String type, int day, int packOrderNum, int comNum, int typeNum) {
		super();
		this.packListNum = packListNum;
		this.type = type;
		this.day = day;
		this.packOrderNum = packOrderNum;
		this.comNum = comNum;
		this.typeNum = typeNum;
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
	@Override
	public String toString() {
		return "PackListDTO [packListNum=" + packListNum + ", type=" + type + ", day=" + day + ", packOrderNum="
				+ packOrderNum + ", comNum=" + comNum + ", typeNum=" + typeNum + "]";
	}
	
	
	
	
	
	

}
