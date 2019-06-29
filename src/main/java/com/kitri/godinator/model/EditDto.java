package com.kitri.godinator.model;

public class EditDto {

	private int editNo;				// 일련번호
	private int boardNo;			// 글번호
	private int ref;				// 그룹번호
	private int pseq;				// 원글번호
	private String state;			// 완료여부
	private String menteeId;		// 멘티 아이디
	private String mentorId;		// 멘토 아이디

	
	public int getEditNo() {
		return editNo;
	}

	public void setEditNo(int editNo) {
		this.editNo = editNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getPseq() {
		return pseq;
	}

	public void setPseq(int pseq) {
		this.pseq = pseq;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getMenteeId() {
		return menteeId;
	}

	public void setMenteeId(String menteeId) {
		this.menteeId = menteeId;
	}

	public String getMentorId() {
		return mentorId;
	}

	public void setMentorId(String mentorId) {
		this.mentorId = mentorId;
	}

}
