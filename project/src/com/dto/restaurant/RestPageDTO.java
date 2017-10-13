package com.dto.restaurant;

import java.util.List;

public class RestPageDTO {
	// 전체 데이터
	private List<RestDTO> list;
	private int curPage; // 현재 페이지
	private int totalCount; // 전체 레코드 갯수
	private static int perPage = 6;
	private String searchName;

	private String searchValue; 
	private String restLocation; //명소별
	private String restType; //타입별
	private String sortRest; //정렬
	
	private int perBlock = 5; // 페이지 당 보여줄 페이지 번호 갯수

	public RestPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RestPageDTO(List<RestDTO> list, int curPage, int totalCount, String searchName, String searchValue,
			String restLocation, String restType, String sortRest, int perBlock) {
		super();
		this.list = list;
		this.curPage = curPage;
		this.totalCount = totalCount;
		this.searchName = searchName;
		this.searchValue = searchValue;
		this.restLocation = restLocation;
		this.restType = restType;
		this.sortRest = sortRest;
		this.perBlock = perBlock;
	}

	public List<RestDTO> getList() {
		return list;
	}

	public void setList(List<RestDTO> list) {
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

	public static int getPerPage() {
		return perPage;
	}

	public static void setPerPage(int perPage) {
		RestPageDTO.perPage = perPage;
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

	public String getRestLocation() {
		return restLocation;
	}

	public void setRestLocation(String restLocation) {
		this.restLocation = restLocation;
	}

	public String getRestType() {
		return restType;
	}

	public void setRestType(String restType) {
		this.restType = restType;
	}

	public String getSortRest() {
		return sortRest;
	}

	public void setSortRest(String sortRest) {
		this.sortRest = sortRest;
	}

	public int getPerBlock() {
		return perBlock;
	}

	public void setPerBlock(int perBlock) {
		this.perBlock = perBlock;
	}

	@Override
	public String toString() {
		return "RestPageDTO [list=" + list + ", curPage=" + curPage + ", totalCount=" + totalCount + ", searchName="
				+ searchName + ", searchValue=" + searchValue + ", restLocation=" + restLocation + ", restType="
				+ restType + ", sortRest=" + sortRest + ", perBlock=" + perBlock + "]";
	}

	

	

}
