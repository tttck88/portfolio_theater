package com.spring.domain;

public class ReservationVO {
	private String r_id, username, nu_id, seat_row, seat_col, p_id;
	private String r_date;
	private int sch_id;
	
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getNu_id() {
		return nu_id;
	}
	public void setNu_id(String nu_id) {
		this.nu_id = nu_id;
	}
	public int getSch_id() {
		return sch_id;
	}
	public void setSch_id(int sch_id) {
		this.sch_id = sch_id;
	}
	public String getSeat_row() {
		return seat_row;
	}
	public void setSeat_row(String seat_row) {
		this.seat_row = seat_row;
	}
	public String getSeat_col() {
		return seat_col;
	}
	public void setSeat_col(String seat_col) {
		this.seat_col = seat_col;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	
	@Override
	public String toString() {
		return "ReservationVO [r_id=" + r_id + ", username=" + username + ", nu_id=" + nu_id + ", sch_id=" + sch_id
				+ ", seat_row=" + seat_row + ", seat_col=" + seat_col + ", p_id=" + p_id + ", r_date=" + r_date + "]";
	}
}
