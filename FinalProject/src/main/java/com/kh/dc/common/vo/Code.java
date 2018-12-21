package com.kh.dc.common.vo;

import java.io.Serializable;

public class Code implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String value;
	private String att;
	
	public Code() {
		super();
	}

	public Code(String id, String value, String att) {
		super();
		this.id = id;
		this.value = value;
		this.att = att;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getAtt() {
		return att;
	}

	public void setAtt(String att) {
		this.att = att;
	}

	@Override
	public String toString() {
		return "Code [id=" + id + ", value=" + value + ", att=" + att + "]";
	}
}
