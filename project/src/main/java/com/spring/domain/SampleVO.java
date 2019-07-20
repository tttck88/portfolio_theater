package com.spring.domain;

public class SampleVO {
	
	private Integer mno;
	private String firstName;
	private String lastname;
	
	public Integer getMno() {
		return mno;
	}
	public void setMno(Integer mno) {
		this.mno = mno;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	
	@Override
	public String toString() {
		return "SampleVO [mno=" + mno + ", firstName=" + firstName + ", lastname=" + lastname + "]";
	}
}
