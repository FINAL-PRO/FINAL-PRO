package com.kh.dc.sale.used.model.vo;

public class Used {

	private int no;
	private int price;
	private String dealType;
	private int boardNo;
	private String status;
	private int goodsNo;
	private String goodsName;
	
	public Used() {
		super();
	}

	public Used(int no, int price, String dealType, int boardNo, String status, int goodsNo, String goodsName) {
		super();
		this.no = no;
		this.price = price;
		this.dealType = dealType;
		this.boardNo = boardNo;
		this.status = status;
		this.goodsNo = goodsNo;
		this.goodsName = goodsName;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDealType() {
		return dealType;
	}

	public void setDealType(String dealType) {
		this.dealType = dealType;
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

	public int getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	@Override
	public String toString() {
		return "Used [no=" + no + ", price=" + price + ", dealType=" + dealType + ", boardNo=" + boardNo + ", status="
				+ status + ", goodsNo=" + goodsNo + ", goodsName=" + goodsName + "]";
	}
	
}
