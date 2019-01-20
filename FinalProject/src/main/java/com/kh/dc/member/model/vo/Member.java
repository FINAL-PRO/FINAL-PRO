package com.kh.dc.member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable{
	
	private int no;
	private String email;
	private String nickName;
	private String password;
	private Date enrollDate;
	private int point;
	private int locationNo;
	private int authNo;
	private String codeId;
	private String address;
	private String name;
	private String deposit;
	private String bank;
	private String profile;
	
	public Member() {
		super();
	}

	public Member(String email, String nickName, String password, int locationNo, String name) {
		super();
		this.email = email;
		this.nickName = nickName;
		this.password = password;
		this.locationNo = locationNo;
		this.name = name;
	}

	public Member(int no, String email, String nickName, String password, Date enrollDate, int point, int locationNo,
			int authNo, String codeId, String address, String name, String deposit, String bank, String profile) {
		super();
		this.no = no;
		this.email = email;
		this.nickName = nickName;
		this.password = password;
		this.enrollDate = enrollDate;
		this.point = point;
		this.locationNo = locationNo;
		this.authNo = authNo;
		this.codeId = codeId;
		this.address = address;
		this.name = name;
		this.deposit = deposit;
		this.bank = bank;
		this.profile = profile;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getLocationNo() {
		return locationNo;
	}

	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}

	public int getAuthNo() {
		return authNo;
	}

	public void setAuthNo(int authNo) {
		this.authNo = authNo;
	}

	public String getCodeId() {
		return codeId;
	}

	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getDeposit() {
		return deposit;
	}

	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	@Override
	public String toString() {
		return "Member [no=" + no + ", email=" + email + ", nickName=" + nickName + ", password=" + password
				+ ", enrollDate=" + enrollDate + ", point=" + point + ", locationNo=" + locationNo + ", authNo="
				+ authNo + ", codeId=" + codeId + ", address=" + address + ", name=" + name + ", deposit=" + deposit
				+ ", bank=" + bank + ", profile=" + profile + "]";
	}

	

}
