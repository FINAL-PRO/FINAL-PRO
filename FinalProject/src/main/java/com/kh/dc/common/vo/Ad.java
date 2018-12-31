package com.kh.dc.common.vo;

import java.io.Serializable;
import java.util.Date;

public class Ad implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int no;
	private String adContentPath;
	private Date startDate;
	private Date endDate;
	private int memberNo;
	private int pageNo;
	private int sectionNo;
	private int locationNo;
	private String adContentType;
	private String adType;
	private String status;
	
	public Ad() {
		super();
	}

	public Ad(int no, String adContentPath, Date startDate, Date endDate, int memberNo, int pageNo, int sectionNo,
			int locationNo, String adContentType, String adType, String status) {
		super();
		this.no = no;
		this.adContentPath = adContentPath;
		this.startDate = startDate;
		this.endDate = endDate;
		this.memberNo = memberNo;
		this.pageNo = pageNo;
		this.sectionNo = sectionNo;
		this.locationNo = locationNo;
		this.adContentType = adContentType;
		this.adType = adType;
		this.status = status;
	}
	
	public Ad(Date startDate, Date endDate, int memberNo, int pageNo, int sectionNo,
			int locationNo, String adContentType, String adType, String status) {
		super();
		this.startDate = startDate;
		this.endDate = endDate;
		this.memberNo = memberNo;
		this.pageNo = pageNo;
		this.sectionNo = sectionNo;
		this.locationNo = locationNo;
		this.adContentType = adContentType;
		this.adType = adType;
		this.status = status;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getAdContentPath() {
		return adContentPath;
	}

	public void setAdContentPath(String adContentPath) {
		this.adContentPath = adContentPath;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getSectionNo() {
		return sectionNo;
	}

	public void setSectionNo(int sectionNo) {
		this.sectionNo = sectionNo;
	}

	public int getLocationNo() {
		return locationNo;
	}

	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}

	public String getAdContentType() {
		return adContentType;
	}

	public void setAdContentType(String adContentType) {
		this.adContentType = adContentType;
	}

	public String getAdType() {
		return adType;
	}

	public void setAdType(String adType) {
		this.adType = adType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Ad [no=" + no + ", adContentPath=" + adContentPath + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", memberNo=" + memberNo + ", pageNo=" + pageNo + ", sectionNo=" + sectionNo + ", locationNo="
				+ locationNo + ", adContentType=" + adContentType + ", adType=" + adType + ", status=" + status + "]";
	}
}
