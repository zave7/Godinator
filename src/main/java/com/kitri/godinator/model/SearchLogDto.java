package com.kitri.godinator.model;

public class SearchLogDto {

	private String schoolCode;		// 학교코드
	private String userId;			// 회원아이디
	private String schoolCate;		// 학교유형
	private int searchCnt;			// 검색수
	private String searchDate;		// 마지막검색시간
	
	public String getSchoolCode() {
		return schoolCode;
	}
	
	public void setSchoolCode(String schoolCode) {
		this.schoolCode = schoolCode;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getSchoolCate() {
		return schoolCate;
	}
	
	public void setSchoolCate(String schoolCate) {
		this.schoolCate = schoolCate;
	}
	
	public int getSearchCnt() {
		return searchCnt;
	}
	
	public void setSearchCnt(int searchCnt) {
		this.searchCnt = searchCnt;
	}
	
	public String getSearchDate() {
		return searchDate;
	}
	
	public void setSearchDate(String searchDate) {
		this.searchDate = searchDate;
	}

	
}
