package com.kitri.godinator.model;

public class MsgDto {

	private int msgNo;			 // 일련번호
	private String sendId;		// 보낸사람
	private String recvId;		// 받은사람
	private String sendDate;	// 송신일
	private String recvDate;	// 수신일
	private String msgTitle;	// 제목
	private String msgContent;	// 내용
	private String sendStus;	// 송신자 보관
	private String recvStus;	// 수신자 보관

	public int getMsgNo() {
		return msgNo;
	}

	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}

	public String getSendId() {
		return sendId;
	}

	public void setSendId(String sendId) {
		this.sendId = sendId;
	}

	public String getRecvId() {
		return recvId;
	}

	public void setRecvId(String recvId) {
		this.recvId = recvId;
	}

	public String getSendDate() {
		return sendDate;
	}

	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}

	public String getRecvDate() {
		return recvDate;
	}

	public void setRecvDate(String recvDate) {
		this.recvDate = recvDate;
	}

	public String getMsgTitle() {
		return msgTitle;
	}

	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public String getSendStus() {
		return sendStus;
	}

	public void setSendStus(String sendStus) {
		this.sendStus = sendStus;
	}

	public String getRecvStus() {
		return recvStus;
	}

	public void setRecvStus(String recvStus) {
		this.recvStus = recvStus;
	}

	

}
