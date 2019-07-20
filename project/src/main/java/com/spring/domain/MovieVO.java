package com.spring.domain;

public class MovieVO {
	
	private int m_id, onair, vote;
	private String title, gnr, director, runningtime, restrict, poster, img1, img2
		,img3, img4, img5, content;
	
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public int getOnair() {
		return onair;
	}
	public void setOnair(int onair) {
		this.onair = onair;
	}
	public int getVote() {
		return vote;
	}
	public void setVote(int vote) {
		this.vote = vote;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGnr() {
		return gnr;
	}
	public void setGnr(String gnr) {
		this.gnr = gnr;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getRunningtime() {
		return runningtime;
	}
	public void setRunningtime(String runningtime) {
		this.runningtime = runningtime;
	}
	public String getRestrict() {
		return restrict;
	}
	public void setRestrict(String restrict) {
		this.restrict = restrict;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Override
	public String toString() {
		return "MovieVO [m_id=" + m_id + ", onair=" + onair + ", vote=" + vote + ", title=" + title + ", gnr=" + gnr
				+ ", director=" + director + ", runningtime=" + runningtime + ", restrict=" + restrict + ", poster="
				+ poster + ", img1=" + img1 + ", img2=" + img2 + ", img3=" + img3 + ", img4=" + img4 + ", img5=" + img5
				+ ", content=" + content + "]";
	}
}
