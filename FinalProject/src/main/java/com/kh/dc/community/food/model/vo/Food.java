package com.kh.dc.community.food.model.vo;

import java.io.Serializable;

import com.kh.dc.common.vo.Board;

public class Food extends Board implements Serializable{
	
	private int no;
	private int boardNo;
	private String category;
	private String address;
	private String thumbnail;
	
	
	public Food() {
		super();
	}

	public Food(int no, int boardNo, String category, String address, String thumbnail) {
		super();
		this.no = no;
		this.boardNo = boardNo;
		this.category = category;
		this.address = address;
		this.thumbnail = thumbnail;
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

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	@Override
	public String toString() {
		return "Food [no=" + no + ", boardNo=" + boardNo + ", category=" + category + ", address=" + address
				+ ", thumbnail=" + thumbnail + "]";
	}

	

}
