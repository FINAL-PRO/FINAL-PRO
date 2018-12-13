package com.kh.dc.test.model.vo;

import java.io.Serializable;

public class TestDc implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String name;
	private int age;
	
	public TestDc() {
		super();
	}
	public TestDc(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return "TestDc [name=" + name + ", age=" + age + "]";
	}
}
