package com.kh.dc.common.vo;

import java.io.Serializable;
import java.sql.Date;

public class Like implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int no;
	private Date likeDate;
	private String boardNo;
	private int memberNo;
	
	public Like() {
		super();
	}

	public Like(int no, Date likeDate, String boardNo, int memberNo) {
		super();
		this.no = no;
		this.likeDate = likeDate;
		this.boardNo = boardNo;
		this.memberNo = memberNo;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public Date getLikeDate() {
		return likeDate;
	}

	public void setLikeDate(Date likeDate) {
		this.likeDate = likeDate;
	}

	public String getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "Like [no=" + no + ", likeDate=" + likeDate + ", boardNo=" + boardNo + ", memberNo=" + memberNo + "]";
	}
}
