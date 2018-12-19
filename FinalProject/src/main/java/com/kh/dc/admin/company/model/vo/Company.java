package com.kh.dc.admin.company.model.vo;

import java.io.Serializable;
import java.util.Date;

public class Company implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5541731243584359797L;

	private int no;
	private String name;
	private Date enrollDate;
	private String address;
	private String status;
	
	public Company() {
		super();
	}
	
	public Company(int no, String name, Date enrollDate, String address, String status) {
		super();
		this.no = no;
		this.name = name;
		this.enrollDate = enrollDate;
		this.address = address;
		this.status = status;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "Company [no=" + no + ", name=" + name + ", enrollDate=" + enrollDate + ", address=" + address
				+ ", status=" + status + "]";
	} 
}
