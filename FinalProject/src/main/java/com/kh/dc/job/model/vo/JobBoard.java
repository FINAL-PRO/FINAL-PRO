package com.kh.dc.job.model.vo;

import java.sql.Date;

import com.kh.dc.common.vo.Board;

public class JobBoard extends Board {
	
	private static final long serialVersionUID = 32838L;	
	
	private int no;
	private String type;
	private int salary;
	private Date startdate;
	private Date enddate;
	private Date startJob;
	private Date endJob;
	private Date startTime;
	private Date endTime;
	private String location;
	private int boardNo;
	private int companyNo;
	private String jobType;
	private String salType;
	private String status;
	
	
	private String nickName;
	private int dday;
	
	public JobBoard() {}

	public JobBoard(int no, String type, int salary, Date startdate, Date enddate, Date startJob, Date endJob,
			Date startTime, Date endTime, String location, int boardNo, int companyNo, String jobType, String salType,
			String status, String nickName, int dday) {
		super();
		this.no = no;
		this.type = type;
		this.salary = salary;
		this.startdate = startdate;
		this.enddate = enddate;
		this.startJob = startJob;
		this.endJob = endJob;
		this.startTime = startTime;
		this.endTime = endTime;
		this.location = location;
		this.boardNo = boardNo;
		this.companyNo = companyNo;
		this.jobType = jobType;
		this.salType = salType;
		this.status = status;
		this.nickName = nickName;
		this.dday = dday;
	}

	public int getDday() {
		return dday;
	}

	public void setDday(int dday) {
		this.dday = dday;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public Date getStartJob() {
		return startJob;
	}

	public void setStartJob(Date startJob) {
		this.startJob = startJob;
	}

	public Date getEndJob() {
		return endJob;
	}

	public void setEndJob(Date endJob) {
		this.endJob = endJob;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public String getSalType() {
		return salType;
	}

	public void setSalType(String salType) {
		this.salType = salType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "JobBoard [no=" + no + ", type=" + type + ", salary=" + salary + ", startdate=" + startdate
				+ ", enddate=" + enddate + ", startJob=" + startJob + ", endJob=" + endJob + ", startTime=" + startTime
				+ ", endTime=" + endTime + ", location=" + location + ", boardNo=" + boardNo + ", companyNo="
				+ companyNo + ", jobType=" + jobType + ", salType=" + salType + ", status=" + status + ", nickName" + nickName + ", dday" + dday  +super.toString() +"]";
	}

	
}
