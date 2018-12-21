package com.kh.dc.common.vo;

import java.io.Serializable;
import java.sql.Date;

public class Report implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int no;
	private int boardNo;
	private int rcNo; // 신고 카테고리(rc) 번호
	private int membmerNo;
	private Date reportDate;
	private String status;
	
	public Report() {
		super();
	}

	public Report(int no, int boardNo, int rcNo, int membmerNo, Date reportDate, String status) {
		super();
		this.no = no;
		this.boardNo = boardNo;
		this.rcNo = rcNo;
		this.membmerNo = membmerNo;
		this.reportDate = reportDate;
		this.status = status;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getRcNo() {
		return rcNo;
	}

	public void setRcNo(int rcNo) {
		this.rcNo = rcNo;
	}

	public int getMembmerNo() {
		return membmerNo;
	}

	public void setMembmerNo(int membmerNo) {
		this.membmerNo = membmerNo;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Report [no=" + no + ", boardNo=" + boardNo + ", rcNo=" + rcNo + ", membmerNo=" + membmerNo
				+ ", reportDate=" + reportDate + ", status=" + status + "]";
	}
}
