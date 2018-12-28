package com.kh.dc.common.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7132581284642993330L;
	
	private int no;
	private String title;
	private Date writeDate;
	private String content;
	private int viewCount;
	private String type;
	private String status;
	private int memberNo;
	private String category;
	
	// DB join용 변수
	private String memberName;
	private String thumbnail;
	private String boardType;
	
	public Board() {
		super();
	}
	
	public Board(int no, String title, Date writeDate, String content, int viewCount, String type, String status,
			int memberNo, String category) {
		super();
		this.no = no;
		this.title = title;
		this.writeDate = writeDate;
		this.content = content;
		this.viewCount = viewCount;
		this.type = type;
		this.status = status;
		this.memberNo = memberNo;
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
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
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
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	@Override
	public String toString() {
		return "Board [no=" + no + ", title=" + title + ", writeDate=" + writeDate + ", content=" + content
				+ ", viewCount=" + viewCount + ", type=" + type + ", status=" + status + ", memberNo=" + memberNo
				+ ", category=" + category + ", memberName=" + memberName + ", thumbnail=" + thumbnail + ", boardType="
				+ boardType + "]";
	}



}
