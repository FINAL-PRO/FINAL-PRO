package com.kh.dc.common.vo;

import java.io.Serializable;
import java.sql.Date;

public class Point implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int no;
	private int getPoint;
	private Date getDate;
	private int memberNo;
	private int contentNo;
	
	public Point() {
		super();
	}

	public Point(int no, int getPoint, Date getDate, int memberNo, int contentNo) {
		super();
		this.no = no;
		this.getPoint = getPoint;
		this.getDate = getDate;
		this.memberNo = memberNo;
		this.contentNo = contentNo;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getGetPoint() {
		return getPoint;
	}

	public void setGetPoint(int getPoint) {
		this.getPoint = getPoint;
	}

	public Date getGetDate() {
		return getDate;
	}

	public void setGetDate(Date getDate) {
		this.getDate = getDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getContentNo() {
		return contentNo;
	}

	public void setContentNo(int contentNo) {
		this.contentNo = contentNo;
	}

	@Override
	public String toString() {
		return "Point [no=" + no + ", getPoint=" + getPoint + ", getDate=" + getDate + ", memberNo=" + memberNo
				+ ", contentNo=" + contentNo + "]";
	}
}
