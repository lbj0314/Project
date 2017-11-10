package com.dto.review;

import java.util.List;

import org.apache.ibatis.type.Alias;

import com.dto.order.PackOrderDTO;
import com.dto.order.PackResultListDTO;

@Alias("ReviewDTO")
public class ReviewDTO{

	
	private int packReviewNum;
	private String packTitle;
	private String packContent;
	private String packReviewWriteDay;
	private int packReviewGoods;
	private int packOrderNum;
	private int comNum;
	private int packReviewRcnt;
	public ReviewDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewDTO(int packReviewNum, String packTitle, String packContent, String packReviewWriteDay,
			int packReviewGoods, int packOrderNum, int comNum, int packReviewRcnt) {
		super();
		this.packReviewNum = packReviewNum;
		this.packTitle = packTitle;
		this.packContent = packContent;
		this.packReviewWriteDay = packReviewWriteDay;
		this.packReviewGoods = packReviewGoods;
		this.packOrderNum = packOrderNum;
		this.comNum = comNum;
		this.packReviewRcnt = packReviewRcnt;
	}
	public int getPackReviewNum() {
		return packReviewNum;
	}
	public void setPackReviewNum(int packReviewNum) {
		this.packReviewNum = packReviewNum;
	}
	public String getPackTitle() {
		return packTitle;
	}
	public void setPackTitle(String packTitle) {
		this.packTitle = packTitle;
	}
	public String getPackContent() {
		return packContent;
	}
	public void setPackContent(String packContent) {
		this.packContent = packContent;
	}
	public String getPackReviewWriteDay() {
		return packReviewWriteDay;
	}
	public void setPackReviewWriteDay(String packReviewWriteDay) {
		this.packReviewWriteDay = packReviewWriteDay;
	}
	public int getPackReviewGoods() {
		return packReviewGoods;
	}
	public void setPackReviewGoods(int packReviewGoods) {
		this.packReviewGoods = packReviewGoods;
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
	public int getPackReviewRcnt() {
		return packReviewRcnt;
	}
	public void setPackReviewRcnt(int packReviewRcnt) {
		this.packReviewRcnt = packReviewRcnt;
	}
	@Override
	public String toString() {
		return "ReviewDTO [packReviewNum=" + packReviewNum + ", packTitle=" + packTitle + ", packContent=" + packContent
				+ ", packReviewWriteDay=" + packReviewWriteDay + ", packReviewGoods=" + packReviewGoods
				+ ", packOrderNum=" + packOrderNum + ", comNum=" + comNum + ", packReviewRcnt=" + packReviewRcnt + "]";
	}  
	
	
	

	
	
	
}
