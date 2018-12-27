package com.kh.dc.common.vo;

import java.io.Serializable;
import java.sql.Date;

public class Comment implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int no;
	private String content;
	private Date writeDate;
	private int memberNo;
	private int boardNo;
	private String status;
	
	// DB join용 변수
	private String memberName;
	private String boardType;
	private String boardTitle;
	
	public Comment() {
		super();
	}

	public Comment(int no, String content, Date writeDate, int memberNo, int boardNo, String status) {
		super();
		this.no = no;
		this.content = content;
		this.writeDate = writeDate;
		this.memberNo = memberNo;
		this.boardNo = boardNo;
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

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	@Override
	public String toString() {
		return "Comment [no=" + no + ", content=" + content + ", writeDate=" + writeDate + ", memberNo=" + memberNo
				+ ", boardNo=" + boardNo + ", status=" + status + ", memberName=" + memberName + "]";
	}
	
}
