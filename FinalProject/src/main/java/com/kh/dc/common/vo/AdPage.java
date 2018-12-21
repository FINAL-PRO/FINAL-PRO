package com.kh.dc.common.vo;

import java.io.Serializable;

public class AdPage implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int no;
	private String name;
	
	public AdPage() {
		super();
	}
	
	public AdPage(int no, String name) {
		super();
		this.no = no;
		this.name = name;
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

	@Override
	public String toString() {
		return "AdPage [no=" + no + ", name=" + name + "]";
	}
}
