package com.kh.dc.info.region.model.vo;

import java.sql.Date;

public class RegionRe implements java.io.Serializable{

	private static final long seriaVersionUID=1L;
	
	private int no;
	private String content;
	private Date writeDate;
	private int boardNo;
	private String status;
	
		
	public RegionRe() {
		super();
	}

	public RegionRe(int no, String content, Date writeDate, int boardNo, String status) {
		super();
		this.no = no;
		this.content = content;
		this.writeDate = writeDate;
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

	@Override
	public String toString() {
		return "RegionRe [no=" + no + ", content=" + content + ", writeDate=" + writeDate + ", boardNo=" + boardNo
				+ ", status=" + status + "]";
	}
	
	
	
}
