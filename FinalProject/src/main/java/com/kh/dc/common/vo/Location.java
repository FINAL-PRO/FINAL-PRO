package com.kh.dc.common.vo;

import java.io.Serializable;

public class Location implements Serializable {
	
	private int no;
	private int parentno;
	private String location;
	
	
	public Location() {
		super();
	}


	public Location(String location) {
		super();
		this.location = location;
	}


	public Location(int no, int parentno, String location) {
		super();
		this.no = no;
		this.parentno = parentno;
		this.location = location;
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public int getParentno() {
		return parentno;
	}


	public void setParentno(int parentno) {
		this.parentno = parentno;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	@Override
	public String toString() {
		return "Location [no=" + no + ", parentno=" + parentno + ", location=" + location + "]";
	}
	
	
	
	

}
