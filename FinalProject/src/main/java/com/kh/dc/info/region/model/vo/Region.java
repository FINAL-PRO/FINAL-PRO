package com.kh.dc.info.region.model.vo;

import java.sql.Date;

public class Region implements java.io.Serializable{

	private static final long seriaVersionUID=1L;
	
	private int no;
	private String title;
	private Date writeDate;
	private String content;
	private int viewcount;
	private String type;
	private String status;
	private String userName;
	private String category;
	private int memberNo;
	
	
	public Region() {
		super();
	}

	public Region(String title, String content, String userName) {
		super();
		this.title = title;
		this.content = content;
		this.userName = userName;
	}

	public Region(int no, String title, Date writeDate, String content, int viewcount, String type, String status,
			String userName, String category) {
		super();
		this.no = no;
		this.title = title;
		this.writeDate = writeDate;
		this.content = content;
		this.viewcount = viewcount;
		this.type = type;
		this.status = status;
		this.userName = userName;
		this.category = category;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViewcount() {
		return viewcount;
	}

	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Region [no=" + no + ", title=" + title + ", writeDate=" + writeDate + ", content=" + content
				+ ", viewcount=" + viewcount + ", type=" + type + ", status=" + status + ", userName=" + userName
				+ ", category=" + category + "]";
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	
}
