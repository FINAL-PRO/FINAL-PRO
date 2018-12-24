package com.kh.dc.common.vo;

import java.io.Serializable;

public class PointContent implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int no;
	private String content;
	
	public PointContent() {
		super();
	}

	public PointContent(int no, String content) {
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
		return "PointContent [no=" + no + ", content=" + content + "]";
	}
}
