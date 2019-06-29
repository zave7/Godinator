package com.kitri.godinator.model;

public class ReportDto {

	private int reportSeq;			 // 일련번호
	private String code;			 // 신고코드
	private int relSeq;				 // 해당일련번호
	private String reportTime;		 // 신고일

	public int getReportSeq() {
		return reportSeq;
	}

	public void setReportSeq(int reportSeq) {
		this.reportSeq = reportSeq;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getRelSeq() {
		return relSeq;
	}

	public void setRelSeq(int relSeq) {
		this.relSeq = relSeq;
	}

	public String getReportTime() {
		return reportTime;
	}

	public void setReportTime(String reportTime) {
		this.reportTime = reportTime;
	}

}
