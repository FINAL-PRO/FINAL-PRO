package com.kh.dc.info.house.model.vo;

import java.sql.Date;

public class House  implements java.io.Serializable{

	private static final long seriaVersionUID=1L;

	// house
	private int hno;										// 부동산 게시판 번호
	private int minprice;
	private int maxprice;
	private int area;
	private int boardNo;							// board 게시판 번호
	private String hType;
	private String dealType;

	
	// board
	private int no;										
	private String title;
	private Date writeDate;
	private String content;
	private int viewcount;
	private String type;
	private String status;
	private String userName;
	private String category;
	
	private String memberNo;
	private String houseImg;
	
	
	public House() {
		super();
	}

	public String getmemberNo() {
		return memberNo;
	}


	public void setmemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public House(int hno, int minprice, int maxprice, int area, int boardNo, String hType, String dealType, int no,
			String title, Date writeDate, String content, int viewcount, String type, String status, String userName,
			String category, String memberNo) {
		super();
		this.hno = hno;
		this.minprice = minprice;
		this.maxprice = maxprice;
		this.area = area;
		this.boardNo = boardNo;
		this.hType = hType;
		this.dealType = dealType;
		this.no = no;
		this.title = title;
		this.writeDate = writeDate;
		this.content = content;
		this.viewcount = viewcount;
		this.type = type;
		this.status = status;
		this.userName = userName;
		this.category = category;
		this.memberNo = memberNo;
	}


	public int getHno() {
		return hno;
	}


	public void setHno(int hno) {
		this.hno = hno;
	}


	public int getMinprice() {
		return minprice;
	}


	public void setMinprice(int minprice) {
		this.minprice = minprice;
	}


	public int getMaxprice() {
		return maxprice;
	}


	public void setMaxprice(int maxprice) {
		this.maxprice = maxprice;
	}


	public int getArea() {
		return area;
	}


	public void setArea(int area) {
		this.area = area;
	}


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public String gethType() {
		return hType;
	}


	public void sethType(String hType) {
		this.hType = hType;
	}


	public String getDealType() {
		return dealType;
	}


	public void setDealType(String dealType) {
		this.dealType = dealType;
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


	public int getViewcount() {
		return viewcount;
	}


	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
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


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	@Override
	public String toString() {
		return "House [hno=" + hno + ", minprice=" + minprice + ", maxprice=" + maxprice + ", area=" + area
				+ ", boardNo=" + boardNo + ", hType=" + hType + ", dealType=" + dealType + ", no=" + no + ", title="
				+ title + ", writeDate=" + writeDate + ", content=" + content + ", viewcount=" + viewcount + ", type="
				+ type + ", status=" + status + ", userName=" + userName + ", category=" + category + ", memberNo =" + memberNo + ", houseImg" + houseImg+"]" ;
	}


	public String getHouseImg() {
		return houseImg;
	}


	public void setHouseImg(String houseImg) {
		this.houseImg = houseImg;
	}
	
	
	
}
	
