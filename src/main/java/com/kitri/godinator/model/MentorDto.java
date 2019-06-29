package com.kitri.godinator.model;

public class MentorDto {

	private String userId;			// 회원아이디
	private String mentor;			// 멘토
	private String aprvlDate;		// 승인일자
	private String cate;			// 구분
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getMentor() {
		return mentor;
	}
	
	public void setMentor(String mentor) {
		this.mentor = mentor;
	}
	
	public String getAprvlDate() {
		return aprvlDate;
	}
	
	public void setAprvlDate(String aprvlDate) {
		this.aprvlDate = aprvlDate;
	}
	
	public String getCate() {
		return cate;
	}
	
	public void setCate(String cate) {
		this.cate = cate;
	}

	
}
