package com.kh.dc.common.vo;

import java.io.Serializable;
import java.sql.Date;

public class Message implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int no;
	private String content;
	private Date sendDate;
	private int fromMember;
	private int toMember;
	private String status;
	
	public Message() {
		super();
	}

	public Message(int no, String content, Date sendDate, int fromMember, int toMember, String status) {
		super();
		this.no = no;
		this.content = content;
		this.sendDate = sendDate;
		this.fromMember = fromMember;
		this.toMember = toMember;
		this.status = status;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	public int getFromMember() {
		return fromMember;
	}

	public void setFromMember(int fromMember) {
		this.fromMember = fromMember;
	}

	public int getToMember() {
		return toMember;
	}

	public void setToMember(int toMember) {
		this.toMember = toMember;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Message [no=" + no + ", content=" + content + ", sendDate=" + sendDate + ", fromMember=" + fromMember
				+ ", toMember=" + toMember + ", status=" + status + "]";
	}
}
