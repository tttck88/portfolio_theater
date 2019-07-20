package com.spring.domain;

import java.util.Date;

public class BoardVO {
	
	private int b_id, m_id, hit, u_id, t_id, replycnt;
	private String b_type, id, title, content, img1, img2, img3, img4, img5;
	private Date regdate;
	
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}
	public int getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	public String getB_type() {
		return b_type;
	}
	public void setB_type(String b_type) {
		this.b_type = b_type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "BoardVO [b_id=" + b_id + ", m_id=" + m_id + ", hit=" + hit + ", u_id=" + u_id + ", t_id=" + t_id
				+ ", replycnt=" + replycnt + ", b_type=" + b_type + ", id=" + id + ", title=" + title + ", content="
				+ content + ", img1=" + img1 + ", img2=" + img2 + ", img3=" + img3 + ", img4=" + img4 + ", img5=" + img5
				+ ", regdate=" + regdate + ", getB_id()=" + getB_id() + ", getM_id()=" + getM_id() + ", getHit()="
				+ getHit() + ", getU_id()=" + getU_id() + ", getT_id()=" + getT_id() + ", getReplycnt()="
				+ getReplycnt() + ", getB_type()=" + getB_type() + ", getId()=" + getId() + ", getTitle()=" + getTitle()
				+ ", getContent()=" + getContent() + ", getImg1()=" + getImg1() + ", getImg2()=" + getImg2()
				+ ", getImg3()=" + getImg3() + ", getImg4()=" + getImg4() + ", getImg5()=" + getImg5()
				+ ", getRegdate()=" + getRegdate() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
}
