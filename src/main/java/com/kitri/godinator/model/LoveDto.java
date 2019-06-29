package com.kitri.godinator.model;

public class LoveDto {

	private int likeNo;				// 일련번호
	private int boardNo;			// 글번호
	private String userId;			// 회원아이디
	private int commentNo;			// 댓글번호
	private String likeUnlike;		// 좋아요싫어요

	public int getLikeNo() {
		return likeNo;
	}

	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getLikeUnlike() {
		return likeUnlike;
	}

	public void setLikeUnlike(String likeUnlike) {
		this.likeUnlike = likeUnlike;
	}

}
