package com.kitri.godinator.model;

public class EvalUDLogDto {

	private String userId;		// 회원아이디
	private int adNo; 			// 장단점일련번호
	private String updown; 		// 공감/비공감

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getAdNo() {
		return adNo;
	}

	public void setAdNo(int adNo) {
		this.adNo = adNo;
	}

	public String getUpdown() {
		return updown;
	}

	public void setUpdown(String updown) {
		this.updown = updown;
	}

}
