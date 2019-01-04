package com.kh.dc.common.vo;

import java.io.Serializable;

public class ReportCategory implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int no;
	private String content;
	
	public ReportCategory() {
		super();
	}

	public ReportCategory(int no, String content) {
		super();
		this.no = no;
		this.content = content;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "ReportCategory [no=" + no + ", content=" + content + "]";
	}
}
