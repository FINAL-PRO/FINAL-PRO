package com.kh.dc.common.vo;

import java.io.Serializable;

public class AdLocation implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int no;
	private int name;
	
	public AdLocation() {
		super();
	}

	public AdLocation(int no, int name) {
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

	public int getName() {
		return name;
	}

	public void setName(int name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "AdLocation [no=" + no + ", name=" + name + "]";
	}
}
