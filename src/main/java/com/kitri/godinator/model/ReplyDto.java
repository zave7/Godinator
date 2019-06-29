package com.kitri.godinator.model;

public class ReplyDto {

	private int commentNo;				// 댓글번호
	private int boardNo;				// 글번호
	private String cUserId;				// 작성자아이디
	private String cPostdate;			// 작성시간
	private String commentContent;		// 내용
	private String state;				// 상태

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getcUserId() {
		return cUserId;
	}

	public void setcUserId(String cUserId) {
		this.cUserId = cUserId;
	}

	public String getcPostdate() {
		return cPostdate;
	}

	public void setcPostdate(String cPostdate) {
		this.cPostdate = cPostdate;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

}
