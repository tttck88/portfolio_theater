package com.spring.domain;

public class ScheduleVO {
	
	private String time, price;
	private int sch_id, m_id, t_id,	scr_id;
	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getSch_id() {
		return sch_id;
	}
	public void setSch_id(int sch_id) {
		this.sch_id = sch_id;
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}
	public int getScr_id() {
		return scr_id;
	}
	public void setScr_id(int scr_id) {
		this.scr_id = scr_id;
	}
	
	@Override
	public String toString() {
		return "ScheduleVO [time=" + time + ", price=" + price + ", sch_id=" + sch_id + ", m_id=" + m_id + ", t_id="
				+ t_id + ", scr_id=" + scr_id + "]";
	}
}
