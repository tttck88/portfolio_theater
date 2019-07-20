package com.spring.domain;

public class TheaterVO {
	
	private String name, phone,	adress,	content, scr_num, img1, img2, img3,	img4, img5, location1, location2;
	private int t_id;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getScr_num() {
		return scr_num;
	}
	public void setScr_num(String scr_num) {
		this.scr_num = scr_num;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public String getImg3() {
		return img3;
	}
	public void setImg3(String img3) {
		this.img3 = img3;
	}
	public String getImg4() {
		return img4;
	}
	public void setImg4(String img4) {
		this.img4 = img4;
	}
	public String getImg5() {
		return img5;
	}
	public void setImg5(String img5) {
		this.img5 = img5;
	}
	public String getLocation1() {
		return location1;
	}
	public void setLocation1(String location1) {
		this.location1 = location1;
	}
	public String getLocation2() {
		return location2;
	}
	public void setLocation2(String location2) {
		this.location2 = location2;
	}
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}
	
	@Override
	public String toString() {
		return "TheaterVO [name=" + name + ", phone=" + phone + ", adress=" + adress + ", content=" + content
				+ ", scr_num=" + scr_num + ", img1=" + img1 + ", img2=" + img2 + ", img3=" + img3 + ", img4=" + img4
				+ ", img5=" + img5 + ", location1=" + location1 + ", location2=" + location2 + ", t_id=" + t_id + "]";
	}
}