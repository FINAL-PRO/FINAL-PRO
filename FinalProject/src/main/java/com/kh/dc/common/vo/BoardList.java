package com.kh.dc.common.vo;

import java.io.Serializable;
import java.sql.Date;

public class BoardList implements Serializable {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
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
	private String profile;
	private String boardType;
	
	// list용 개수 변수
	private int commentCount;
	private int likeCount;
	private int imageCheck;
	
	public BoardList() {
		super();
	}

	public BoardList(int no, String title, Date writeDate, String content, int viewCount, String type, String status,
			int memberNo, String category, String memberName, String profile, String boardType, int commentCount,
			int likeCount, int imageCheck) {
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
		this.memberName = memberName;
		this.profile = profile;
		this.boardType = boardType;
		this.commentCount = commentCount;
		this.likeCount = likeCount;
		this.imageCheck = imageCheck;
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

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getImageCheck() {
		return imageCheck;
	}

	public void setImageCheck(int imageCheck) {
		this.imageCheck = imageCheck;
	}

	@Override
	public String toString() {
		return "BoardList [no=" + no + ", title=" + title + ", writeDate=" + writeDate + ", content=" + content
				+ ", viewCount=" + viewCount + ", type=" + type + ", status=" + status + ", memberNo=" + memberNo
				+ ", category=" + category + ", memberName=" + memberName + ", profile=" + profile + ", boardType="
				+ boardType + ", commentCount=" + commentCount + ", likeCount=" + likeCount + ", imageCheck="
				+ imageCheck + "]";
	}
	
}
	