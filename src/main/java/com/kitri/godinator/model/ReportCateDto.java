package com.kitri.godinator.model;

public class ReportCateDto {

	private int code;			// 신고코드
	private String subject;		// 신고유형

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
}
