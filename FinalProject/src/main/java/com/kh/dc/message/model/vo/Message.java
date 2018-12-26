package com.kh.dc.message.model.vo;

import java.util.Date;

public class Message {
	private int no;
	private String content;
	private Date date;
	private int fromMember;
	private int toMember;
	private String status;
	
	public Message() {}

	public Message(int no, String content, Date date, int fromMember, int toMember, String status) {
		super();
		this.no = no;
		this.content = content;
		this.date = date;
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
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
		return "Message [no=" + no + ", content=" + content + ", date=" + date + ", fromMember=" + fromMember
				+ ", toMember=" + toMember + ", status=" + status + "]";
	}
	
}
