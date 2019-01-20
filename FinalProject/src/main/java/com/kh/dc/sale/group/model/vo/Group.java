package com.kh.dc.sale.group.model.vo;

import java.io.Serializable;
import java.sql.Date;

import com.kh.dc.common.vo.Board;

public class Group extends Board implements Serializable {

	private static final long serialVersionUID = 7361860356985183342L;

	private int no;
	private int price;
	private int maxCount;
	private int currentCount;
	private int boardNo;
	private String status;
	private String dealType;
	private int goodsNo;
	private String deposit;
	private Date endDate;
	private String goodsName;
	private String goodsPicture;
	private String bank;
	
	// DB join용 변수
	private String goodsCategory;
	
	public Group() {
		super();
	}

	public Group(int no, int price, int maxCount, int currentCount, int boardNo, String status, String dealType,
			int goodsNo, String deposit, Date endDate, String goodsName, String goodsPicture, String bank,
			String goodsCategory) {
		super();
		this.no = no;
		this.price = price;
		this.maxCount = maxCount;
		this.currentCount = currentCount;
		this.boardNo = boardNo;
		this.status = status;
		this.dealType = dealType;
		this.goodsNo = goodsNo;
		this.deposit = deposit;
		this.endDate = endDate;
		this.goodsName = goodsName;
		this.goodsPicture = goodsPicture;
		this.bank = bank;
		this.goodsCategory = goodsCategory;
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

	public int getMaxCount() {
		return maxCount;
	}

	public void setMaxCount(int maxCount) {
		this.maxCount = maxCount;
	}

	public int getCurrentCount() {
		return currentCount;
	}

	public void setCurrentCount(int currentCount) {
		this.currentCount = currentCount;
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

	public String getDealType() {
		return dealType;
	}

	public void setDealType(String dealType) {
		this.dealType = dealType;
	}

	public int getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}

	public String getDeposit() {
		return deposit;
	}

	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getGoodsPicture() {
		return goodsPicture;
	}

	public void setGoodsPicture(String goodsPicture) {
		this.goodsPicture = goodsPicture;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getGoodsCategory() {
		return goodsCategory;
	}

	public void setGoodsCategory(String goodsCategory) {
		this.goodsCategory = goodsCategory;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Group [no=" + no + ", price=" + price + ", maxCount=" + maxCount + ", currentCount=" + currentCount
				+ ", boardNo=" + boardNo + ", status=" + status + ", dealType=" + dealType + ", goodsNo=" + goodsNo
				+ ", deposit=" + deposit + ", endDate=" + endDate + ", goodsName=" + goodsName + ", goodsPicture=" 
				+ goodsPicture + ", goodsCategory=" + goodsCategory + ", Board=" + super.toString() + "]";
	}
	
}
