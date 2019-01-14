package com.kh.dc.community.food.model.vo;

import java.io.Serializable;

import com.kh.dc.common.vo.Board;
import com.kh.dc.common.vo.BoardList;

public class FoodList extends Board implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int no;
	private int fno;
	private int pno;
	private String title;
	private String content;
	private String memberName;
	private String thumbnail;
	private int commentCount;
	private int likeCount;
	private String category;
	private String address;
	private int point;
	private int imageCheck;
	
	public FoodList() {
		super();
	}

	public FoodList(int no, int fno, int pno, String title, String content, String memberName, String thumbnail,
			int commentCount, int likeCount, String category, String address, int point, int imageCheck) {
		super();
		this.no = no;
		this.fno = fno;
		this.pno = pno;
		this.title = title;
		this.content = content;
		this.memberName = memberName;
		this.thumbnail = thumbnail;
		this.commentCount = commentCount;
		this.likeCount = likeCount;
		this.category = category;
		this.address = address;
		this.point = point;
		this.imageCheck = imageCheck;
	}


	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getImageCheck() {
		return imageCheck;
	}

	public void setImageCheck(int imageCheck) {
		this.imageCheck = imageCheck;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "FoodList [no=" + no + ", fno=" + fno + ", pno=" + pno + ", title=" + title + ", content=" + content
				+ ", memberName=" + memberName + ", thumbnail=" + thumbnail + ", commentCount=" + commentCount
				+ ", likeCount=" + likeCount + ", category=" + category + ", address=" + address + ", point=" + point
				+ ", imageCheck=" + imageCheck + "]";
	}

}
