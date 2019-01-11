package com.kh.dc.community.food.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class FoodPoint implements Serializable{

	private int no;
	private int point;
	private Date writeDate;
	private int foodNo;
	private int memberNo;
	
	public FoodPoint() {
		super();
	}

	public FoodPoint(int no, int point, Date writeDate, int foodNo, int memberNo) {
		super();
		this.no = no;
		this.point = point;
		this.writeDate = writeDate;
		this.foodNo = foodNo;
		this.memberNo = memberNo;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getFoodNo() {
		return foodNo;
	}

	public void setFoodNo(int foodNo) {
		this.foodNo = foodNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "FoodPoint [no=" + no + ", point=" + point + ", writeDate=" + writeDate + ", foodNo=" + foodNo
				+ ", memberNo=" + memberNo + "]";
	}
		
}
