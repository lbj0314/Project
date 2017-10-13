package com.dto.tour;

import java.util.List;

public class TourPageDTO {
	// 전체 데이터
	private List<TourDTO> list;
	private int curPage; // 현재 페이지
	private int totalCount; // 전체 레코드 갯수
	private static int perPage = 6;
	private String searchName;

	private String searchValue; 
	private String attLocation; //명소별
	private String attType; //타입별
	private String sortAtt; //정렬
	
	

	

	public String getSortAtt() {
		return sortAtt;
	}

	public void setSortAtt(String sortAtt) {
		this.sortAtt = sortAtt;
	}

	public String getAttType() {
		return attType;
	}

	public void setAttType(String attType) {
		this.attType = attType;
	}

	public String getAttLocation() {
		return attLocation;
	}

	public void setAttLocation(String attLocation) {
		this.attLocation = attLocation;
	}

	public static int getPerPage() {
		return perPage;
	}

	public static void setPerPage(int perPage) {
		TourPageDTO.perPage = perPage;
	}

	private int perBlock = 5; // 페이지 당 보여줄 페이지 번호 갯수

	public int getPerBlock() {
		return perBlock;
	}

	public void setPerBlock(int perBlock) {
		this.perBlock = perBlock;
	}

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public List<TourDTO> getList() {
		return list;
	}

	public void setList(List<TourDTO> list) {
		this.list = list;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

}
