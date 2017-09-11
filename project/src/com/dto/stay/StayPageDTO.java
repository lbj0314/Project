package com.dto.stay;

import java.util.List;

import com.dto.stay.StayDTO;

public class StayPageDTO {

	private List<StayDTO> list;
	private int stayCurPage; // 현재 페이지
	private int stayTotalCount; // 전체 레코드 갯수
	private static int stayPerPage = 6;
	private String staySearchName;
	private int stayPerBlock = 5; //페이지당 보여줄 갯수
	private String staySearchValue; 
	private String stayLocation; //명소별
	private String stayGrade; //등급별
	private String stayType; //타입별
	private String sortStay; //정렬
	public StayPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StayPageDTO(List<StayDTO> list, int stayCurPage, int stayTotalCount, String staySearchName, int stayPerBlock,
			String staySearchValue, String stayLocation, String stayGrade, String stayType, String sortStay) {
		super();
		this.list = list;
		this.stayCurPage = stayCurPage;
		this.stayTotalCount = stayTotalCount;
		this.staySearchName = staySearchName;
		this.stayPerBlock = stayPerBlock;
		this.staySearchValue = staySearchValue;
		this.stayLocation = stayLocation;
		this.stayGrade = stayGrade;
		this.stayType = stayType;
		this.sortStay = sortStay;
	}
	public List<StayDTO> getList() {
		return list;
	}
	public void setList(List<StayDTO> list) {
		this.list = list;
	}
	public int getStayCurPage() {
		return stayCurPage;
	}
	public void setStayCurPage(int stayCurPage) {
		this.stayCurPage = stayCurPage;
	}
	public int getStayTotalCount() {
		return stayTotalCount;
	}
	public void setStayTotalCount(int stayTotalCount) {
		this.stayTotalCount = stayTotalCount;
	}
	public static int getStayPerPage() {
		return stayPerPage;
	}
	public static void setStayPerPage(int stayPerPage) {
		StayPageDTO.stayPerPage = stayPerPage;
	}
	public String getStaySearchName() {
		return staySearchName;
	}
	public void setStaySearchName(String staySearchName) {
		this.staySearchName = staySearchName;
	}
	public int getStayPerBlock() {
		return stayPerBlock;
	}
	public void setStayPerBlock(int stayPerBlock) {
		this.stayPerBlock = stayPerBlock;
	}
	public String getStaySearchValue() {
		return staySearchValue;
	}
	public void setStaySearchValue(String staySearchValue) {
		this.staySearchValue = staySearchValue;
	}
	public String getStayLocation() {
		return stayLocation;
	}
	public void setStayLocation(String stayLocation) {
		this.stayLocation = stayLocation;
	}
	public String getStayGrade() {
		return stayGrade;
	}
	public void setStayGrade(String stayGrade) {
		this.stayGrade = stayGrade;
	}
	public String getStayType() {
		return stayType;
	}
	public void setStayType(String stayType) {
		this.stayType = stayType;
	}
	public String getSortStay() {
		return sortStay;
	}
	public void setSortStay(String sortStay) {
		this.sortStay = sortStay;
	}
	@Override
	public String toString() {
		return "StayPageDTO [list=" + list + ", stayCurPage=" + stayCurPage + ", stayTotalCount=" + stayTotalCount
				+ ", staySearchName=" + staySearchName + ", stayPerBlock=" + stayPerBlock + ", staySearchValue="
				+ staySearchValue + ", stayLocation=" + stayLocation + ", stayGrade=" + stayGrade + ", stayType="
				+ stayType + ", sortStay=" + sortStay + "]";
	}
	
	
}
