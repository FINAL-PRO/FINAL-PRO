package com.kh.dc.common.vo;

import java.io.Serializable;
import java.util.Date;

public class AdList implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int no;
	private Date startDate;
	private Date endDate;
	private String userName;
	private String pageName;
	private String sectionName;
	private String locationName;
	private String adContentType;
	private String adType;
	private String status;
	
	public AdList() {
		super();
	}

	public AdList(int no, Date startDate, Date endDate, String userName, String pageName, String sectionName,
			String locationName, String adContentType, String adType, String status) {
		super();
		this.no = no;
		this.startDate = startDate;
		this.endDate = endDate;
		this.userName = userName;
		this.pageName = pageName;
		this.sectionName = sectionName;
		this.locationName = locationName;
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

	public String getSectionName() {
		return sectionName;
	}

	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
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
		return "AdList [no=" + no + ", startDate=" + startDate + ", endDate=" + endDate + ", userName=" + userName
				+ ", pageName=" + pageName + ", sectionName=" + sectionName + ", locationName=" + locationName
				+ ", adContentType=" + adContentType + ", adType=" + adType + ", status=" + status + "]";
	}
	
	


}
