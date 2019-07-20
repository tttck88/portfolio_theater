package com.spring.domain;

public class ScreenVO {
	
	private int scr_id, t_id, scr_seat_row, scr_seat_col, scr_seat_tot;
	private String scr_name;
	
	public int getScr_id() {
		return scr_id;
	}
	public void setScr_id(int scr_id) {
		this.scr_id = scr_id;
	}
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}
	public int getScr_seat_row() {
		return scr_seat_row;
	}
	public void setScr_seat_row(int scr_seat_row) {
		this.scr_seat_row = scr_seat_row;
	}
	public int getScr_seat_col() {
		return scr_seat_col;
	}
	public void setScr_seat_col(int scr_seat_col) {
		this.scr_seat_col = scr_seat_col;
	}
	public int getScr_seat_tot() {
		return scr_seat_tot;
	}
	public void setScr_seat_tot(int scr_seat_tot) {
		this.scr_seat_tot = scr_seat_tot;
	}
	public String getScr_name() {
		return scr_name;
	}
	public void setScr_name(String scr_name) {
		this.scr_name = scr_name;
	}
	
	@Override
	public String toString() {
		return "ScreenVO [scr_id=" + scr_id + ", t_id=" + t_id + ", scr_seat_row=" + scr_seat_row + ", scr_seat_col="
				+ scr_seat_col + ", scr_seat_tot=" + scr_seat_tot + ", scr_name=" + scr_name + "]";
	}
}
