package com.dto.restaurant;

import java.util.List;

import com.dto.restaurant.RestDTO;

public class RestPageDTO {

	private List<RestDTO> list;
	private int restCurPage; // 현재 페이지
	private int restTotalCount; // 전체 레코드 갯수
	private static int restPerPage = 6;
	private String restSearchName;
	private int restPerBlock = 5; //페이지당 보여줄 갯수
	private String restSearchValue; 
	private String restLocation; //명소별
	private String restType; //타입별
	private String sortRest; //정렬
	
	
	
	public RestPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RestPageDTO(List<RestDTO> list, int restCurPage, int restTotalCount, String restSearchName, int restPerBlock,
			String restSearchValue, String restLocation, String restType, String sortRest) {
		super();
		this.list = list;
		this.restCurPage = restCurPage;
		this.restTotalCount = restTotalCount;
		this.restSearchName = restSearchName;
		this.restPerBlock = restPerBlock;
		this.restSearchValue = restSearchValue;
		this.restLocation = restLocation;
		this.restType = restType;
		this.sortRest = sortRest;
	}
	public List<RestDTO> getList() {
		return list;
	}
	public void setList(List<RestDTO> list) {
		this.list = list;
	}
	public int getRestCurPage() {
		return restCurPage;
	}
	public void setRestCurPage(int restCurPage) {
		this.restCurPage = restCurPage;
	}
	public int getRestTotalCount() {
		return restTotalCount;
	}
	public void setRestTotalCount(int restTotalCount) {
		this.restTotalCount = restTotalCount;
	}
	public static int getRestPerPage() {
		return restPerPage;
	}
	public static void setRestPerPage(int restPerPage) {
		RestPageDTO.restPerPage = restPerPage;
	}
	public String getRestSearchName() {
		return restSearchName;
	}
	public void setRestSearchName(String restSearchName) {
		this.restSearchName = restSearchName;
	}
	public int getRestPerBlock() {
		return restPerBlock;
	}
	public void setRestPerBlock(int restPerBlock) {
		this.restPerBlock = restPerBlock;
	}
	public String getRestSearchValue() {
		return restSearchValue;
	}
	public void setRestSearchValue(String restSearchValue) {
		this.restSearchValue = restSearchValue;
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
	@Override
	public String toString() {
		return "RestPageDTO [list=" + list + ", restCurPage=" + restCurPage + ", restTotalCount=" + restTotalCount
				+ ", restSearchName=" + restSearchName + ", restPerBlock=" + restPerBlock + ", restSearchValue="
				+ restSearchValue + ", restLocation=" + restLocation + ", restType=" + restType + ", sortRest="
				+ sortRest + "]";
	}
	
	
}
